import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/Video_Player.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/Photo_View_Screen.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/orderDetailWidgets.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_app_bar.dart';
import 'package:http/http.dart' as http;

class orderDetailScreen extends StatefulWidget {
  const orderDetailScreen({super.key});

  @override
  State<orderDetailScreen> createState() => _orderDetailScreenState();
}

class _orderDetailScreenState extends State<orderDetailScreen> {
  bool isCurrentPlaying = false;
  String? currentPlayingFile;

  final AudioPlayer _audioPlayer = AudioPlayer(); // Initialize AudioPlayer

  Future<void> _playSegment(String filePath) async {
    if (currentPlayingFile != filePath) {
      await _audioPlayer.stop(); // Stop any currently playing audio
      await _audioPlayer
          .play(DeviceFileSource(filePath)); // Play the selected audio file
      setState(() {
        isCurrentPlaying = true;
        currentPlayingFile = filePath; // Update current playing file
      });
    }
  }

  Future<void> _stopPlayback() async {
    await _audioPlayer.stop();
    setState(() {
      isCurrentPlaying = false;
      currentPlayingFile = null; // Clear current playing file
    });
  }

  // Future<void> _downloadFile(BuildContext context, String filePath) async {
//   var status =
//   await Permission.storage.request(); // Request storage permissions
// }
  Future<void> _downloadFile(BuildContext context, String filePath) async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
      if (!(await Permission.storage.isGranted)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Storage permission denied!")),
        );
        return;
      }
    }
    try {
      Directory? directory = await getExternalStorageDirectory();
      String newPath = "";
      if (directory != null) {
        List<String> paths = directory.path.split("/");
        for (int i = 1; i < paths.length; i++) {
          String folder = paths[i];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }
        }
        newPath = "$newPath/Download"; // Saving to Download folder
        directory = Directory(newPath);
      }

      if (!await directory!.exists()) {
        await directory.create(recursive: true);
      }
      String fileName = filePath.split('/').last;
      File sourceFile = File(filePath);
      File newFile = File("${directory?.path}/$fileName");
      await sourceFile.copy(newFile.path);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Download successful!'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Download failed: ${e.toString()}'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: GetBuilder<OrderController>(
          builder: (controller) => CustomAppBar(
            title: controller.selectNewOrderListData?.productName ?? "",
            isBackButtonExist: true,
          ),
        ),
      ),
      body: GetBuilder<OrderController>(builder: (controller) {
        return controller.isLoading
            ? Container()
            : buildOrderDetail(controller);
      }),
    );
  }

  Widget buildOrderDetail(OrderController controller) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Retailer Name", style: JosefinSansMedium),
                  Text(controller.selectNewOrderListData?.customerName ?? "",
                      style: JosefinRegular),
                ],
              ),
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    controller.selectNewOrderListData?.orderStatusName ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Due Date", style: JosefinSansMedium),
                  Text(controller.selectNewOrderListData?.customerDueDate ?? "",
                      style: JosefinRegular),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.share, color: Colors.grey),
                      onPressed: () async {
                        await shareProductMedia();
                      }),
                ],
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: const [
              //     Text("Work Order Type", style: customer2),
              //     Text("New Size", style: JosefinRegular),
              //   ],
              // ),
            ],
          ),
          const SizedBox(height: 10),
          const Text("JEWEL DETAILS",
              style: TextStyle(
                  color: brandPrimaryColor,
                  fontFamily: 'JosefinSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const Divider(),

          Text(controller.selectNewOrderListData?.productName ?? "",
              style: TextStyle(
                  color: brandGreyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),

          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Weight", style: JosefinSansMedium),
                    Text(
                      controller.selectNewOrderListData?.grossWt ?? "",
                      style: JosefinRegular,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 100),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Design", style: JosefinSansMedium),
                    Text(
                      controller.selectNewOrderListData?.designName ?? "",
                      style: JosefinRegular,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Purity", style: JosefinSansMedium),
                    Text(
                      controller.selectNewOrderListData?.purchaseTouch ?? "",
                      style: JosefinRegular,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 100),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dimension", style: JosefinSansMedium),
                    Text(
                      controller.selectNewOrderListData?.size ?? "",
                      style: JosefinRegular,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Stone Type", style: JosefinSansMedium),
                Text(
                    controller.selectNewOrderListData?.customizedStoneName ??
                        "",
                    style: JosefinRegular),
              ]),),
              SizedBox(width: 100),
              Expanded(
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Stone Weight", style: JosefinSansMedium),
                Text(controller.selectNewOrderListData?.stoneWt ?? "",
                    style: JosefinRegular),
              ]),),
            ],
          ),
          // const SizedBox(height: 15),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: const [
          //     Text("Stone quantity", style: JosefinSansMedium),
          //     Text("XXXXX123", style: JosefinRegular),
          //   ],
          // ),
          const SizedBox(height: 10),
          (controller.selectNewOrderListData?.previewImages != null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Images Reference',
                        style: TextStyle(
                            color: white8,
                            fontFamily: 'JosefinSans',
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller
                          .selectNewOrderListData?.previewImages?.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Icon(Icons.photo, color: brandGreyColor),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "photo ${index + 1}.jpg",
                                style: TextStyle(
                                    color: white8,
                                    fontSize: 16,
                                    fontFamily: 'JosefinSans',
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_downward,
                                  color: brandGreyColor),
                              onPressed: () => controller.downloadFile(
                                  context,
                                  controller.selectNewOrderListData
                                          ?.previewImages?[index].image ??
                                      ""),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove_red_eye_outlined,
                                  color: brandGreyColor),
                              onPressed: () {
                                List<String> allImagePaths = controller
                                    .selectNewOrderListData!.previewImages!
                                    .map((img) => img.image ?? "")
                                    .toList();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShowImageGallery(
                                      imagePaths: allImagePaths,
                                      startIndex: index,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    )
                  ],
                )
              : Container(),
          const SizedBox(height: 15),
          (controller.selectNewOrderListData?.previewVideos != null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Video Reference',
                      style: TextStyle(
                        color: white8,
                        fontFamily: 'JosefinSans',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller
                              .selectNewOrderListData?.previewVideos?.length ??
                          0,
                      itemBuilder: (context, index) {
                        final videoPath = controller.selectNewOrderListData
                                ?.previewVideos?[index]?.video ??
                            "";

                        return Row(
                          children: [
                            const Icon(Icons.photo, color: brandGreyColor),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "Video ${index + 1}.mp4",
                                style: const TextStyle(
                                  color: white8,
                                  fontSize: 16,
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_downward,
                                  color: brandGreyColor),
                              onPressed: () {
                                _downloadFile(context, videoPath);
                              },
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              icon: const Icon(Icons.visibility,
                                  color: brandGreyColor),
                              onPressed: () {
                                showVideoViewer(context, videoPath);
                              },
                            ),
                          ],
                        );
                      },
                    )
                  ],
                )
              : Container(),

          const SizedBox(height: 15),
          (controller.selectNewOrderListData?.previewVoices != null)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Audio Reference',
                      style: TextStyle(
                        color: white8,
                        fontFamily: 'JosefinSans',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller
                              .selectNewOrderListData?.previewVoices?.length ??
                          0,
                      itemBuilder: (context, index) {
                        final audioPath = controller.selectNewOrderListData
                                ?.previewVoices?[index]?.audio ??
                            "";

                        return Row(
                          children: [
                            Icon(Icons.mic, color: brandGreyColor),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "audio ${index + 1}.mp3",
                                style: const TextStyle(
                                  color: white8,
                                  fontSize: 16,
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_downward,
                                  color: brandGreyColor),
                              onPressed: () {
                                _downloadFile(context, audioPath);
                              },
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              icon: Icon(
                                  isCurrentPlaying &&
                                          currentPlayingFile == audioPath
                                      ? Icons.stop
                                      : Icons.play_arrow,
                                  color: brandGreyColor),
                              onPressed: () {
                                if (isCurrentPlaying &&
                                    currentPlayingFile == audioPath) {
                                  _stopPlayback(); // Stop if the same audio is clicked
                                } else {
                                  _playSegment(audioPath); // Play the new audio
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                )
              : Container(),

          const SizedBox(height: 20),

          const Text("Description",
              style: TextStyle(
                  color: brandPrimaryColor,
                  fontFamily: 'JosefinSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text(controller.selectNewOrderListData?.remarks ?? "",
              style: JosefinRegular),
          const SizedBox(height: 20),

          buildChangeStatus(controller),
          const SizedBox(height: 15),
          buildSelectButton(),
        ],
      ),
    );
  }

  void showVideoViewer(BuildContext context, String videoPath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => VideoPlayerScreen(videoPath: videoPath),
      ),
    );
  }

  Future<void> shareProductMedia() async {
    final controller = Get.find<OrderController>();
    final String productName =
        controller.selectNewOrderListData?.productName ?? "";
    final String weight = controller.selectNewOrderListData?.grossWt ?? "";
    final String design = controller.selectNewOrderListData?.designName ?? "";
    final String order = controller.selectNewOrderListData?.orderNo ?? "";
    final String description = controller.selectNewOrderListData?.remarks ?? "";

    final List<String> imageUrls =
        (controller.selectNewOrderListData?.previewImages ?? [])
            .map<String>((e) => e.image ?? "")
            .where((url) => url.isNotEmpty)
            .toList();

    final List<String> videoUrls =
        (controller.selectNewOrderListData?.previewVideos ?? [])
            .map<String>((e) => e.video ?? "")
            .where((url) => url.isNotEmpty)
            .toList();

    final List<String> audioUrls =
        (controller.selectNewOrderListData?.previewVoices ?? [])
            .map<String>((e) => e.audio ?? "")
            .where((url) => url.isNotEmpty)
            .toList();

    final List<String> allUrls = [...imageUrls, ...videoUrls, ...audioUrls];
    final List<XFile> filesToShare = [];

    final String message = '''
Check out this product:
Order No: $order
Product Name: $productName
Design: $design
Gross Weight: $weight
Description: $description
''';

    final tempDir = await getTemporaryDirectory();
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: true,
    );
    for (final url in allUrls) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final fileName = basename(Uri.parse(url).path);
          final filePath = '${tempDir.path}/$fileName';
          final file = File(filePath);
          await file.writeAsBytes(response.bodyBytes);

          // Detect MIME type
          final ext = fileName.split('.').last.toLowerCase();
          String mimeType = 'application/octet-stream';
          if (['jpg', 'jpeg'].contains(ext)) mimeType = 'image/jpeg';
          else if (ext == 'png') mimeType = 'image/png';
          else if (ext == 'mp4') mimeType = 'video/mp4';
          else if (['mp3', 'aac', 'wav'].contains(ext)) mimeType = 'audio/mpeg';

          filesToShare.add(XFile(filePath, mimeType: mimeType, name: fileName));
        }
      } catch (e) {
        print('Download failed for $url: $e');
      }
    }    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    if (filesToShare.isNotEmpty) {
      // await Share.shareXFiles(filesToShare, text: message);
      await Share.shareXFiles([filesToShare.first], text: message);
    } else {
      await Share.share(message);
    }
  }

}
