class OpenOrderListModel {
  List<OpenOrderData>? data;
  String? message;

  OpenOrderListModel({this.data, this.message});

  OpenOrderListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <OpenOrderData>[];
      json['data'].forEach((v) {
        data!.add(new OpenOrderData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class OpenOrderData {
  int? detailId;
  Null? stoneDetails;
  int? pieces;
  String? grossWt;
  String? lessWt;
  String? netWt;
  String? diamondWt;
  String? stoneWt;
  int? wastagePercent;
  String? wastageWt;
  int? mcType;
  String? mcValue;
  String? otherChargesAmnt;
  String? otherMetalAmnt;
  String? otherMetalWt;
  String? ratePerGram;
  String? taxableAmnt;
  int? taxType;
  int? taxPercent;
  String? taxAmnt;
  String? cgstAmnt;
  String? sgstAmnt;
  String? igstAmnt;
  String? itemCost;
  String? discountAmnt;
  Null? linkedDate;
  Null? unlinkedDate;
  Null? unlinkedReason;
  String? customerDueDate;
  String? karigarDueDate;
  String? remarks;
  Null? cancelReason;
  Null? cancelledDate;
  Null? updatedOn;
  Null? deliveredOn;
  String? karigarCharges;
  String? customerCharges;
  String? totalCharges;
  String? taxCharges;
  bool? isReservedItem;
  Null? voiceNote;
  Null? nickName;
  String? customizedRefNo;
  String? customizedProductName;
  String? customizedDesignName;
  String? dimension;
  String? customizedStoneName;
  String? customizedStoneWt;
  String? purchaseTouch;
  String? purchaseVa;
  String? repairApproxAmt;
  int? order;
  int? purity;
  int? uom;
  Null? erpTag;
  int? product;
  int? design;
  Null? subDesign;
  Null? size;
  Null? repairType;
  Null? calculationType;
  int? tax;
  int? orderStatus;
  Null? linkedBy;
  Null? unlinkedBy;
  Null? cancelledBy;
  Null? updatedBy;
  Null? receipt;
  List<Null>? orderRepairType;
  String? orderStatusName;
  String? colour;
  String? orderNo;
  String? productName;
  String? designName;
  List<PreviewImages>? previewImages;
  String? image;
  String? imageText;
  String? video;
  String? videoText;
  List<PreviewVoices>? previewVoices;
  String? audio;
  String? audioText;
  int? orderId;
  String? date;
  int? orderType;
  String? orderDate;
  int? isRateFixedOnOrder;
  int? addedThrough;
  String? totalDiscount;
  String? createdOn;
  int? orderBranch;
  int? finYear;
  int? customer;
  Null? supplier;
  int? createdBy;
  String? branchName;
  String? customerName;
  String? customerMobile;
  String? uomName;
  List<PreviewVideos>? previewVideos;

  OpenOrderData(
      {this.detailId,
      this.stoneDetails,
      this.pieces,
      this.grossWt,
      this.lessWt,
      this.netWt,
      this.diamondWt,
      this.stoneWt,
      this.wastagePercent,
      this.wastageWt,
      this.mcType,
      this.mcValue,
      this.otherChargesAmnt,
      this.otherMetalAmnt,
      this.otherMetalWt,
      this.ratePerGram,
      this.taxableAmnt,
      this.taxType,
      this.taxPercent,
      this.taxAmnt,
      this.cgstAmnt,
      this.sgstAmnt,
      this.igstAmnt,
      this.itemCost,
      this.discountAmnt,
      this.linkedDate,
      this.unlinkedDate,
      this.unlinkedReason,
      this.customerDueDate,
      this.karigarDueDate,
      this.remarks,
      this.cancelReason,
      this.cancelledDate,
      this.updatedOn,
      this.deliveredOn,
      this.karigarCharges,
      this.customerCharges,
      this.totalCharges,
      this.taxCharges,
      this.isReservedItem,
      this.voiceNote,
      this.nickName,
      this.customizedRefNo,
      this.customizedProductName,
      this.customizedDesignName,
      this.dimension,
      this.customizedStoneName,
      this.customizedStoneWt,
      this.purchaseTouch,
      this.purchaseVa,
      this.repairApproxAmt,
      this.order,
      this.purity,
      this.uom,
      this.erpTag,
      this.product,
      this.design,
      this.subDesign,
      this.size,
      this.repairType,
      this.calculationType,
      this.tax,
      this.orderStatus,
      this.linkedBy,
      this.unlinkedBy,
      this.cancelledBy,
      this.updatedBy,
      this.receipt,
      this.orderRepairType,
      this.orderStatusName,
      this.colour,
      this.orderNo,
      this.productName,
      this.designName,
      this.previewImages,
      this.image,
      this.imageText,
      this.video,
      this.videoText,
      this.previewVoices,
      this.audio,
      this.audioText,
      this.orderId,
      this.date,
      this.orderType,
      this.orderDate,
      this.isRateFixedOnOrder,
      this.addedThrough,
      this.totalDiscount,
      this.createdOn,
      this.orderBranch,
      this.finYear,
      this.customer,
      this.supplier,
      this.createdBy,
      this.branchName,
      this.customerName,
      this.customerMobile,
      this.uomName,
      this.previewVideos});

  OpenOrderData.fromJson(Map<String, dynamic> json) {
    detailId = json['detail_id'];
    stoneDetails = json['stone_details'];
    pieces = json['pieces'];
    grossWt = json['gross_wt'];
    lessWt = json['less_wt'];
    netWt = json['net_wt'];
    diamondWt = json['diamond_wt'];
    stoneWt = json['stone_wt'];
    wastagePercent = json['wastage_percent'];
    wastageWt = json['wastage_wt'];
    mcType = json['mc_type'];
    mcValue = json['mc_value'];
    otherChargesAmnt = json['other_charges_amnt'];
    otherMetalAmnt = json['other_metal_amnt'];
    otherMetalWt = json['other_metal_wt'];
    ratePerGram = json['rate_per_gram'];
    taxableAmnt = json['taxable_amnt'];
    taxType = json['tax_type'];
    taxPercent = json['tax_percent'];
    taxAmnt = json['tax_amnt'];
    cgstAmnt = json['cgst_amnt'];
    sgstAmnt = json['sgst_amnt'];
    igstAmnt = json['igst_amnt'];
    itemCost = json['item_cost'];
    discountAmnt = json['discount_amnt'];
    linkedDate = json['linked_date'];
    unlinkedDate = json['unlinked_date'];
    unlinkedReason = json['unlinked_reason'];
    customerDueDate = json['customer_due_date'];
    karigarDueDate = json['karigar_due_date'];
    remarks = json['remarks'];
    cancelReason = json['cancel_reason'];
    cancelledDate = json['cancelled_date'];
    updatedOn = json['updated_on'];
    deliveredOn = json['delivered_on'];
    karigarCharges = json['karigar_charges'];
    customerCharges = json['customer_charges'];
    totalCharges = json['total_charges'];
    taxCharges = json['tax_charges'];
    isReservedItem = json['is_reserved_item'];
    voiceNote = json['voice_note'];
    nickName = json['nick_name'];
    customizedRefNo = json['customized_ref_no'];
    customizedProductName = json['customized_product_name'];
    customizedDesignName = json['customized_design_name'];
    dimension = json['dimension'];
    customizedStoneName = json['customized_stone_name'];
    customizedStoneWt = json['customized_stone_wt'];
    purchaseTouch = json['purchase_touch'];
    purchaseVa = json['purchase_va'];
    repairApproxAmt = json['repair_approx_amt'];
    order = json['order'];
    purity = json['purity'];
    uom = json['uom'];
    erpTag = json['erp_tag'];
    product = json['product'];
    design = json['design'];
    subDesign = json['sub_design'];
    size = json['size'];
    repairType = json['repair_type'];
    calculationType = json['calculation_type'];
    tax = json['tax'];
    orderStatus = json['order_status'];
    linkedBy = json['linked_by'];
    unlinkedBy = json['unlinked_by'];
    cancelledBy = json['cancelled_by'];
    updatedBy = json['updated_by'];
    receipt = json['receipt'];
    orderStatusName = json['order_status_name'];
    colour = json['colour'];
    orderNo = json['order_no'];
    productName = json['product_name'];
    designName = json['design_name'];
    if (json['preview_images'] != null) {
      previewImages = <PreviewImages>[];
      json['preview_images'].forEach((v) {
        previewImages!.add(new PreviewImages.fromJson(v));
      });
    }
    image = json['image'];
    imageText = json['image_text'];
    video = json['video'];
    videoText = json['video_text'];
    if (json['preview_voices'] != null) {
      previewVoices = <PreviewVoices>[];
      json['preview_voices'].forEach((v) {
        previewVoices!.add(new PreviewVoices.fromJson(v));
      });
    }
    audio = json['audio'];
    audioText = json['audio_text'];
    orderId = json['order_id'];
    date = json['date'];
    orderType = json['order_type'];
    orderDate = json['order_date'];
    isRateFixedOnOrder = json['is_rate_fixed_on_order'];
    addedThrough = json['added_through'];
    totalDiscount = json['total_discount'];
    createdOn = json['created_on'];
    orderBranch = json['order_branch'];
    finYear = json['fin_year'];
    customer = json['customer'];
    supplier = json['supplier'];
    createdBy = json['created_by'];
    branchName = json['branch_name'];
    customerName = json['customer_name'];
    customerMobile = json['customer_mobile'];
    uomName = json['uom_name'];
    if (json['preview_videos'] != null) {
      previewVideos = <PreviewVideos>[];
      json['preview_videos'].forEach((v) {
        previewVideos!.add(new PreviewVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail_id'] = this.detailId;
    data['stone_details'] = this.stoneDetails;
    data['pieces'] = this.pieces;
    data['gross_wt'] = this.grossWt;
    data['less_wt'] = this.lessWt;
    data['net_wt'] = this.netWt;
    data['diamond_wt'] = this.diamondWt;
    data['stone_wt'] = this.stoneWt;
    data['wastage_percent'] = this.wastagePercent;
    data['wastage_wt'] = this.wastageWt;
    data['mc_type'] = this.mcType;
    data['mc_value'] = this.mcValue;
    data['other_charges_amnt'] = this.otherChargesAmnt;
    data['other_metal_amnt'] = this.otherMetalAmnt;
    data['other_metal_wt'] = this.otherMetalWt;
    data['rate_per_gram'] = this.ratePerGram;
    data['taxable_amnt'] = this.taxableAmnt;
    data['tax_type'] = this.taxType;
    data['tax_percent'] = this.taxPercent;
    data['tax_amnt'] = this.taxAmnt;
    data['cgst_amnt'] = this.cgstAmnt;
    data['sgst_amnt'] = this.sgstAmnt;
    data['igst_amnt'] = this.igstAmnt;
    data['item_cost'] = this.itemCost;
    data['discount_amnt'] = this.discountAmnt;
    data['linked_date'] = this.linkedDate;
    data['unlinked_date'] = this.unlinkedDate;
    data['unlinked_reason'] = this.unlinkedReason;
    data['customer_due_date'] = this.customerDueDate;
    data['karigar_due_date'] = this.karigarDueDate;
    data['remarks'] = this.remarks;
    data['cancel_reason'] = this.cancelReason;
    data['cancelled_date'] = this.cancelledDate;
    data['updated_on'] = this.updatedOn;
    data['delivered_on'] = this.deliveredOn;
    data['karigar_charges'] = this.karigarCharges;
    data['customer_charges'] = this.customerCharges;
    data['total_charges'] = this.totalCharges;
    data['tax_charges'] = this.taxCharges;
    data['is_reserved_item'] = this.isReservedItem;
    data['voice_note'] = this.voiceNote;
    data['nick_name'] = this.nickName;
    data['customized_ref_no'] = this.customizedRefNo;
    data['customized_product_name'] = this.customizedProductName;
    data['customized_design_name'] = this.customizedDesignName;
    data['dimension'] = this.dimension;
    data['customized_stone_name'] = this.customizedStoneName;
    data['customized_stone_wt'] = this.customizedStoneWt;
    data['purchase_touch'] = this.purchaseTouch;
    data['purchase_va'] = this.purchaseVa;
    data['repair_approx_amt'] = this.repairApproxAmt;
    data['order'] = this.order;
    data['purity'] = this.purity;
    data['uom'] = this.uom;
    data['erp_tag'] = this.erpTag;
    data['product'] = this.product;
    data['design'] = this.design;
    data['sub_design'] = this.subDesign;
    data['size'] = this.size;
    data['repair_type'] = this.repairType;
    data['calculation_type'] = this.calculationType;
    data['tax'] = this.tax;
    data['order_status'] = this.orderStatus;
    data['linked_by'] = this.linkedBy;
    data['unlinked_by'] = this.unlinkedBy;
    data['cancelled_by'] = this.cancelledBy;
    data['updated_by'] = this.updatedBy;
    data['receipt'] = this.receipt;

    data['order_status_name'] = this.orderStatusName;
    data['colour'] = this.colour;
    data['order_no'] = this.orderNo;
    data['product_name'] = this.productName;
    data['design_name'] = this.designName;
    if (this.previewImages != null) {
      data['preview_images'] =
          this.previewImages!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['image_text'] = this.imageText;
    data['video'] = this.video;
    data['video_text'] = this.videoText;
    if (this.previewVoices != null) {
      data['preview_voices'] =
          this.previewVoices!.map((v) => v.toJson()).toList();
    }
    data['audio'] = this.audio;
    data['audio_text'] = this.audioText;
    data['order_id'] = this.orderId;
    data['date'] = this.date;
    data['order_type'] = this.orderType;
    data['order_date'] = this.orderDate;
    data['is_rate_fixed_on_order'] = this.isRateFixedOnOrder;
    data['added_through'] = this.addedThrough;
    data['total_discount'] = this.totalDiscount;
    data['created_on'] = this.createdOn;
    data['order_branch'] = this.orderBranch;
    data['fin_year'] = this.finYear;
    data['customer'] = this.customer;
    data['supplier'] = this.supplier;
    data['created_by'] = this.createdBy;
    data['branch_name'] = this.branchName;
    data['customer_name'] = this.customerName;
    data['customer_mobile'] = this.customerMobile;
    data['uom_name'] = this.uomName;
    if (this.previewVideos != null) {
      data['preview_videos'] =
          this.previewVideos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreviewImages {
  int? detOrderImgId;
  String? name;
  String? image;
  int? orderDetail;

  PreviewImages({this.detOrderImgId, this.name, this.image, this.orderDetail});

  PreviewImages.fromJson(Map<String, dynamic> json) {
    detOrderImgId = json['det_order_img_id'];
    name = json['name'];
    image = json['image'];
    orderDetail = json['order_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['det_order_img_id'] = this.detOrderImgId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['order_detail'] = this.orderDetail;
    return data;
  }
}

class PreviewVoices {
  int? detOrderAudioId;
  int? orderDetail;
  String? name;
  String? audio;

  PreviewVoices(
      {this.detOrderAudioId, this.orderDetail, this.name, this.audio});

  PreviewVoices.fromJson(Map<String, dynamic> json) {
    detOrderAudioId = json['det_order_audio_id'];
    orderDetail = json['order_detail'];
    name = json['name'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['det_order_audio_id'] = this.detOrderAudioId;
    data['order_detail'] = this.orderDetail;
    data['name'] = this.name;
    data['audio'] = this.audio;
    return data;
  }
}

class PreviewVideos {
  int? detOrderVidId;
  int? orderDetail;
  String? name;
  String? video;

  PreviewVideos({this.detOrderVidId, this.orderDetail, this.name, this.video});

  PreviewVideos.fromJson(Map<String, dynamic> json) {
    detOrderVidId = json['det_order_vid_id'];
    orderDetail = json['order_detail'];
    name = json['name'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['det_order_vid_id'] = this.detOrderVidId;
    data['order_detail'] = this.orderDetail;
    data['name'] = this.name;
    data['video'] = this.video;
    return data;
  }
}
