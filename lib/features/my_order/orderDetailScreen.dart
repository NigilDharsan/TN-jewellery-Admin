import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/my_order/controller/order_controller.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/Photo_View_Screen.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/Video_Player.dart';
import 'package:tn_jewellery_admin/features/my_order/widgets/orderDetailWidgets.dart';
import 'package:tn_jewellery_admin/utils/colors.dart';
import 'package:tn_jewellery_admin/utils/styles.dart';
import 'package:tn_jewellery_admin/utils/widgets/custom_app_bar.dart';

class orderDetailScreen extends StatefulWidget {
  const orderDetailScreen({super.key});

  @override
  State<orderDetailScreen> createState() => _orderDetailScreenState();
}

class _orderDetailScreenState extends State<orderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: 'SPARKLE RING',
            isBackButtonExist: true,
          )),
      body: GetBuilder<OrderController>(builder: (controller) {
        return controller.isLoading
            ? Container()
            : buildOrderDetail(controller);
      }),
    );
  }
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
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: const [
            //     Text("Work Order Type", style: JosefinSansMedium),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Weight", style: JosefinSansMedium),
              Text(controller.selectNewOrderListData?.grossWt ?? "",
                  style: JosefinRegular),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Design ", style: JosefinSansMedium),
              Text(controller.selectNewOrderListData?.designName ?? "",
                  style: JosefinRegular),
            ]),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Purity", style: JosefinSansMedium),
              Text("91.6", style: JosefinRegular),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Dimension", style: JosefinSansMedium),
              Text(controller.selectNewOrderListData?.size ?? "",
                  style: JosefinRegular),
            ]),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Stone Type", style: JosefinSansMedium),
              Text(controller.selectNewOrderListData?.customizedStoneName ?? "",
                  style: JosefinRegular),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Stone Weight", style: JosefinSansMedium),
              Text(controller.selectNewOrderListData?.stoneWt ?? "",
                  style: JosefinRegular),
            ]),
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
                  const Text('Video Reference',
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
                        .selectNewOrderListData?.previewVideos?.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Icon(Icons.photo, color: brandGreyColor),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "video ${index + 1}.mp4",
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
                            onPressed: () {
                              controller.downloadFile(
                                  context,
                                  controller.selectNewOrderListData
                                          ?.previewVideos?[index].video ??
                                      "");
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_red_eye_outlined,
                                color: brandGreyColor),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => VideoPlayerScreen(
                                      videoPath: controller
                                              .selectNewOrderListData
                                              ?.previewVideos?[index]
                                              .video ??
                                          ""),
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
        controller.selectNewOrderListData?.previewVoices != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Audio Reference',
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
                        .selectNewOrderListData?.previewVoices?.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Icon(Icons.volume_up, color: brandGreyColor),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "Audio ${index + 1}.mp3",
                              style: TextStyle(
                                  color: white8,
                                  fontFamily: 'JosefinSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_downward,
                                color: brandGreyColor),
                            onPressed: () {
                              controller.downloadFile(
                                  context,
                                  controller.selectNewOrderListData
                                          ?.previewVoices?[index].audio ??
                                      "");
                            },
                          ),
                          IconButton(
                            icon: Icon(
                                controller.isCurrentPlaying &&
                                        controller.currentPlayingFile ==
                                            "${controller.selectNewOrderListData?.previewVoices?[index].audio ?? ""}"
                                    ? Icons.stop
                                    : Icons.play_arrow,
                                color: brandGreyColor),
                            onPressed: () {
                              if (controller.isCurrentPlaying &&
                                  controller.currentPlayingFile ==
                                      "${controller.selectNewOrderListData?.previewVoices?[index].audio ?? ""}") {
                                controller.stopPlayback();
                              } else {
                                controller.playSegment(
                                    "${controller.selectNewOrderListData?.previewVoices?[index].audio ?? ""}"); // Provide the correct audio file
                              }
                            },
                          ),
                        ],
                      );
                    },
                  )
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
            style: JosefinSansRegular),
        const SizedBox(height: 20),

        buildChangeStatus(controller),
        const SizedBox(height: 15),
        buildSelectButton(),
      ],
    ),
  );
}
