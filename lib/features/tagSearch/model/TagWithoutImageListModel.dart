class TagWithoutImageListModel {
  bool? status;
  List<Data>? data;

  TagWithoutImageListModel({this.status, this.data});

  TagWithoutImageListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? tagId;
  String? tagCode;
  String? productName;
  String? grossWt;
  String? netWt;

  Data({this.tagId, this.tagCode, this.productName, this.grossWt, this.netWt});

  Data.fromJson(Map<String, dynamic> json) {
    tagId = json['tag_id'];
    tagCode = json['tag_code'];
    productName = json['product_name'];
    grossWt = json['gross_wt'];
    netWt = json['net_wt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag_id'] = this.tagId;
    data['tag_code'] = this.tagCode;
    data['product_name'] = this.productName;
    data['gross_wt'] = this.grossWt;
    data['net_wt'] = this.netWt;
    return data;
  }
}
