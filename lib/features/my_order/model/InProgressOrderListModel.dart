class InProgressOrderListModel {
  List<InProgressOrderData>? data;
  String? message;

  InProgressOrderListModel({this.data, this.message});

  InProgressOrderListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <InProgressOrderData>[];
      json['data'].forEach((v) {
        data!.add(new InProgressOrderData.fromJson(v));
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

class InProgressOrderData {
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

  String? itemCost;
  String? customerDueDate;
  String? karigarDueDate;
  String? remarks;
  String? cancelReason;
  String? cancelledDate;
  String? updatedOn;
  String? deliveredOn;
  String? nickName;
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
  int? erpTag;
  int? product;
  int? design;
  Null? subDesign;
  Null? size;
  int? orderStatus;
  String? productName;
  String? designName;
  String? uomName;
  String? orderStatusName;
  String? colour;
  String? orderNo;
  double? purityValue;
  String? image;
  String? imageText;
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
  String? supplier;
  int? createdBy;
  String? branchName;
  String? customerName;
  String? customerMobile;
  String? idJobOrderDetail;
  String? dueDate;
  String? deliveryDate;
  String? jobOrder;
  String? orderDetail;
  String? status;
  String? supplierName;
  String? supplierMobile;
  String? tagCode;

  InProgressOrderData(
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
      this.itemCost,
      this.customerDueDate,
      this.karigarDueDate,
      this.remarks,
      this.cancelReason,
      this.cancelledDate,
      this.updatedOn,
      this.deliveredOn,
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
      this.erpTag,
      this.product,
      this.design,
      this.subDesign,
      this.size,
      this.orderStatus,
      this.productName,
      this.designName,
      this.uomName,
      this.orderStatusName,
      this.colour,
      this.orderNo,
      this.purityValue,
      this.image,
      this.imageText,
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
      this.idJobOrderDetail,
      this.dueDate,
      this.deliveryDate,
      this.jobOrder,
      this.orderDetail,
      this.status,
      this.supplierName,
      this.supplierMobile,
      this.tagCode});

  InProgressOrderData.fromJson(Map<String, dynamic> json) {
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

    itemCost = json['item_cost'];

    customerDueDate = json['customer_due_date'];
    karigarDueDate = json['karigar_due_date'];
    remarks = json['remarks'];
    cancelReason = json['cancel_reason'];
    cancelledDate = json['cancelled_date'];
    updatedOn = json['updated_on'];
    deliveredOn = json['delivered_on'];

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
    erpTag = json['erp_tag'];
    product = json['product'];
    design = json['design'];
    subDesign = json['sub_design'];
    size = json['size'];

    orderStatus = json['order_status'];

    productName = json['product_name'];
    designName = json['design_name'];
    uomName = json['uom_name'];
    orderStatusName = json['order_status_name'];
    colour = json['colour'];
    orderNo = json['order_no'];
    purityValue = json['purity_value'];
    image = json['image'];
    imageText = json['image_text'];
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
    idJobOrderDetail = json['id_job_order_detail']?.toString() ?? '';
    dueDate = json['due_date']?.toString() ?? '';
    deliveryDate = json['delivery_date']?.toString() ?? '';
    jobOrder = json['job_order']?.toString() ?? '';
    orderDetail = json['order_detail']?.toString() ?? '';
    status = json['status']?.toString() ?? '';
    supplierName = json['supplier_name']?.toString() ?? '';
    supplierMobile = json['supplier_mobile'];
    tagCode = json['tag_code']?.toString() ?? '';
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
    data['item_cost'] = this.itemCost;
    data['customer_due_date'] = this.customerDueDate;
    data['karigar_due_date'] = this.karigarDueDate;
    data['remarks'] = this.remarks;
    data['cancel_reason'] = this.cancelReason;
    data['cancelled_date'] = this.cancelledDate;
    data['updated_on'] = this.updatedOn;
    data['delivered_on'] = this.deliveredOn;
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
    data['erp_tag'] = this.erpTag;
    data['product'] = this.product;
    data['design'] = this.design;
    data['sub_design'] = this.subDesign;
    data['size'] = this.size;

    data['order_status'] = this.orderStatus;

    data['product_name'] = this.productName;
    data['design_name'] = this.designName;
    data['uom_name'] = this.uomName;
    data['order_status_name'] = this.orderStatusName;
    data['colour'] = this.colour;
    data['order_no'] = this.orderNo;
    data['purity_value'] = this.purityValue;
    data['image'] = this.image;
    data['image_text'] = this.imageText;
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
    data['id_job_order_detail'] = this.idJobOrderDetail;
    data['due_date'] = this.dueDate;
    data['delivery_date'] = this.deliveryDate;
    data['job_order'] = this.jobOrder;
    data['order_detail'] = this.orderDetail;
    data['status'] = this.status;
    data['supplier_name'] = this.supplierName;
    data['supplier_mobile'] = this.supplierMobile;
    data['tag_code'] = this.tagCode;

    return data;
  }
}
