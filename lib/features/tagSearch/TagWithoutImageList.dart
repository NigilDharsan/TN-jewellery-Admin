import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tn_jewellery_admin/features/tagSearch/controller/tag_controller.dart';
import 'package:tn_jewellery_admin/utils/core/helper/route_helper.dart';

class TagWithoutImageList extends StatefulWidget {
  const TagWithoutImageList({super.key});

  @override
  State<TagWithoutImageList> createState() => _TagWithoutImageListState();
}

class _TagWithoutImageListState extends State<TagWithoutImageList> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    Get.find<TagController>().getTagWithoutImageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tag List")),
      body: GetBuilder<TagController>(builder: (controller) {
        final filteredTags = controller.tagListModel?.data
                ?.where((tag) =>
                    tag.productName
                        ?.toLowerCase()
                        .contains(_searchQuery.toLowerCase()) ??
                    false)
                .toList() ??
            [];

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search by product name',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
            Expanded(child: _buildList(filteredTags, controller)),
          ],
        );
      }),
    );
  }

  Widget _buildList(List<dynamic> filteredTags, TagController controller) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTags.length,
      itemBuilder: (context, index) {
        final tag = filteredTags[index];

        return InkWell(
          onTap: () {
            controller.selectedTag = tag.tagCode ?? "";
            controller.update();
            Get.toNamed(RouteHelper.tagsearchscreen);
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildField("Tag Code", tag.tagCode ?? ""),
                      const SizedBox(width: 12),
                      _buildField("Product Name", tag.productName ?? ""),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildField("Gross Wt", tag.grossWt ?? ""),
                      const SizedBox(width: 12),
                      _buildField("Net Wt", tag.netWt ?? ""),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildField(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
