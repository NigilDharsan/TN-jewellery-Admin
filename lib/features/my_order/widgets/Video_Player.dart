import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({super.key, required this.videoPath});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isFullScreen = false;
  bool _isVolumeMute = false;
  bool _isPortraitMode = true;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    _controller = widget.videoPath.startsWith("http")
        ? VideoPlayerController.network(widget.videoPath)
        : VideoPlayerController.file(File(widget.videoPath));

    _controller.initialize().then((_) {
      setState(() {
        _controller.play();
        _isPlaying = true;
        _controller.setLooping(true);
      });
    }).catchError((e) {
      print("Video initialization failed: $e");
    });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _resetToPortrait();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      _isPlaying = !_isPlaying;
    });
  }

  void _toggleFullScreen() {
    setState(() {
      _isPortraitMode = !_isPortraitMode;
      if (_isPortraitMode) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      }
    });
  }

  void _resetToPortrait() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _onVolumeChanged() {
    setState(() {
      if (_isVolumeMute) {
        _controller.setVolume(1);
      } else {
        _controller.setVolume(0);
      }
      _isVolumeMute = !_isVolumeMute;
    });
  }

  void _onProgressChanged(double value) {
    final position = Duration(seconds: value.toInt());
    _controller.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? Stack(
                children: [
                  GestureDetector(
                    onTap: _togglePlayPause,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  if (_isPlaying)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        color: Colors.black54,
                        child: VideoPlayerControls(
                          controller: _controller,
                          isPlaying: _isPlaying,
                          onPlayPause: _togglePlayPause,
                          onVolumeChanged: _onVolumeChanged,
                          onProgressChanged: _onProgressChanged,
                          onFullScreen: _toggleFullScreen,
                          isVolumeMute: _isVolumeMute,
                        ),
                      ),
                    )
                  else
                    Center(
                      child: IconButton(
                        icon: Icon(Icons.play_arrow,
                            color: Colors.white, size: 60),
                        onPressed: _togglePlayPause,
                      ),
                    ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

class VideoPlayerControls extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isPlaying;
  final Function onPlayPause;
  final Function onVolumeChanged;
  final Function onProgressChanged;
  final Function onFullScreen;
  final bool isVolumeMute;

  const VideoPlayerControls({
    super.key,
    required this.controller,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onVolumeChanged,
    required this.onProgressChanged,
    required this.onFullScreen,
    required this.isVolumeMute,
  });

  @override
  Widget build(BuildContext context) {
    final duration = controller.value.duration;
    final position = controller.value.position;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () => onPlayPause(),
        ),
        Text(_formatDuration(position), style: TextStyle(color: Colors.white)),
        Expanded(
          child: Slider(
            value: position.inSeconds.toDouble(),
            min: 0.0,
            max: duration.inSeconds.toDouble(),
            onChanged: (value) {
              onProgressChanged(value);
            },
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
          ),
        ),
        Text(
          _formatDuration(duration - position),
          style: TextStyle(color: Colors.white),
        ),
        IconButton(
          icon: Icon(
            isVolumeMute ? Icons.volume_mute : Icons.volume_up,
            color: Colors.white,
          ),
          onPressed: () => onVolumeChanged(),
        ),
        IconButton(
          icon: Icon(Icons.fullscreen, color: Colors.white),
          onPressed: () => onFullScreen(),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
