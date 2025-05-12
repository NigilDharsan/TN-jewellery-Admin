class TagModel {
  Data? data;
  String? message;

  TagModel({this.data, this.message});

  TagModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? tagId;
  List<StoneDetails>? stoneDetails;
  String? date;
  int? catId;
  int? taxId;
  Null? weightRange;
  String? purchaseDate;
  String? monthSupCode;
  String? tagCode;
  String? tagDate;
  int? tagPcs;
  String? tagGwt;
  String? tagLwt;
  String? tagNwt;
  String? tagStnWt;
  String? tagDiaWt;
  String? tagOtherMetalWt;
  String? tagWastagePercentage;
  String? tagWastageWt;
  int? tagMcType;
  String? tagMcValue;
  String? tagBuyRate;
  String? tagSellRate;
  String? tagTaxAmount;
  String? tagItemCost;
  String? tagPurchaseTouch;
  String? tagPurchaseVa;
  String? tagPurchaseMc;
  int? tagPurchaseMcType;
  int? tagPurchaseCalcType;
  String? tagPureWt;
  String? tagPurchaseRate;
  int? tagPurchaseRateCalcType;
  Null? tagHuid;
  Null? tagHuid2;
  String? tagPurchaseCost;
  int? isPartialSale;
  bool? isSpecialDiscountApplied;
  String? flatMcValue;
  String? oldTagCode;
  String? oldTagId;
  bool? isImported;
  bool? isIssuedToCounter;
  String? createdOn;
  String? updatedOn;
  int? finYear;
  int? idBranch;
  int? tagBranch;
  int? tagCurrentBranch;
  int? tagLotInwardDetails;
  int? tagProductId;
  int? tagDesignId;
  Null? tagSubDesignId;
  int? tagSectionId;
  int? tagOrderDet;
  int? tagPurityId;
  int? tagUomId;
  Null? tagCalculationType;
  Null? tagTaxGrpId;
  Null? size;
  Null? container;
  int? tagStatus;
  int? idSupplier;
  int? createdBy;
  Null? updatedBy;
  String? branchName;
  String? productName;
  String? productCode;
  String? salesMode;
  String? fixedRateType;
  String? designName;
  String? uom;
  String? taxType;
  String? supplier;
  String? supplierShortCode;
  String? supplierName;
  String? purityName;
  String? metalName;
  String? metal;
  List<TagImages>? tagImages;

  Data(
      {this.tagId,
      this.stoneDetails,
      this.date,
      this.catId,
      this.taxId,
      this.weightRange,
      this.purchaseDate,
      this.monthSupCode,
      this.tagCode,
      this.tagDate,
      this.tagPcs,
      this.tagGwt,
      this.tagLwt,
      this.tagNwt,
      this.tagStnWt,
      this.tagDiaWt,
      this.tagOtherMetalWt,
      this.tagWastagePercentage,
      this.tagWastageWt,
      this.tagMcType,
      this.tagMcValue,
      this.tagBuyRate,
      this.tagSellRate,
      this.tagTaxAmount,
      this.tagItemCost,
      this.tagPurchaseTouch,
      this.tagPurchaseVa,
      this.tagPurchaseMc,
      this.tagPurchaseMcType,
      this.tagPurchaseCalcType,
      this.tagPureWt,
      this.tagPurchaseRate,
      this.tagPurchaseRateCalcType,
      this.tagHuid,
      this.tagHuid2,
      this.tagPurchaseCost,
      this.isPartialSale,
      this.isSpecialDiscountApplied,
      this.flatMcValue,
      this.oldTagCode,
      this.oldTagId,
      this.isImported,
      this.isIssuedToCounter,
      this.createdOn,
      this.updatedOn,
      this.finYear,
      this.idBranch,
      this.tagBranch,
      this.tagCurrentBranch,
      this.tagLotInwardDetails,
      this.tagProductId,
      this.tagDesignId,
      this.tagSubDesignId,
      this.tagSectionId,
      this.tagOrderDet,
      this.tagPurityId,
      this.tagUomId,
      this.tagCalculationType,
      this.tagTaxGrpId,
      this.size,
      this.container,
      this.tagStatus,
      this.idSupplier,
      this.createdBy,
      this.updatedBy,
      this.branchName,
      this.productName,
      this.productCode,
      this.salesMode,
      this.fixedRateType,
      this.designName,
      this.uom,
      this.taxType,
      this.supplier,
      this.supplierShortCode,
      this.supplierName,
      this.purityName,
      this.metalName,
      this.metal,
      this.tagImages});

  Data.fromJson(Map<String, dynamic> json) {
    tagId = json['tag_id'];
    if (json['stone_details'] != null) {
      stoneDetails = <StoneDetails>[];
      json['stone_details'].forEach((v) {
        stoneDetails!.add(new StoneDetails.fromJson(v));
      });
    }
    date = json['date'];
    catId = json['cat_id'];
    taxId = json['tax_id'];
    weightRange = json['weight_range'];
    purchaseDate = json['purchase_date'];
    monthSupCode = json['month_sup_code'];
    tagCode = json['tag_code'];
    tagDate = json['tag_date'];
    tagPcs = json['tag_pcs'];
    tagGwt = json['tag_gwt'];
    tagLwt = json['tag_lwt'];
    tagNwt = json['tag_nwt'];
    tagStnWt = json['tag_stn_wt'];
    tagDiaWt = json['tag_dia_wt'];
    tagOtherMetalWt = json['tag_other_metal_wt'];
    tagWastagePercentage = json['tag_wastage_percentage'];
    tagWastageWt = json['tag_wastage_wt'];
    tagMcType = json['tag_mc_type'];
    tagMcValue = json['tag_mc_value'];
    tagBuyRate = json['tag_buy_rate'];
    tagSellRate = json['tag_sell_rate'];
    tagTaxAmount = json['tag_tax_amount'];
    tagItemCost = json['tag_item_cost'];
    tagPurchaseTouch = json['tag_purchase_touch'];
    tagPurchaseVa = json['tag_purchase_va'];
    tagPurchaseMc = json['tag_purchase_mc'];
    tagPurchaseMcType = json['tag_purchase_mc_type'];
    tagPurchaseCalcType = json['tag_purchase_calc_type'];
    tagPureWt = json['tag_pure_wt'];
    tagPurchaseRate = json['tag_purchase_rate'];
    tagPurchaseRateCalcType = json['tag_purchase_rate_calc_type'];
    tagHuid = json['tag_huid'];
    tagHuid2 = json['tag_huid2'];
    tagPurchaseCost = json['tag_purchase_cost'];
    isPartialSale = json['is_partial_sale'];
    isSpecialDiscountApplied = json['is_special_discount_applied'];
    flatMcValue = json['flat_mc_value'];
    oldTagCode = json['old_tag_code'];
    oldTagId = json['old_tag_id'];
    isImported = json['is_imported'];
    isIssuedToCounter = json['is_issued_to_counter'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    finYear = json['fin_year'];
    idBranch = json['id_branch'];
    tagBranch = json['tag_branch'];
    tagCurrentBranch = json['tag_current_branch'];
    tagLotInwardDetails = json['tag_lot_inward_details'];
    tagProductId = json['tag_product_id'];
    tagDesignId = json['tag_design_id'];
    tagSubDesignId = json['tag_sub_design_id'];
    tagSectionId = json['tag_section_id'];
    tagOrderDet = json['tag_order_det'];
    tagPurityId = json['tag_purity_id'];
    tagUomId = json['tag_uom_id'];
    tagCalculationType = json['tag_calculation_type'];
    tagTaxGrpId = json['tag_tax_grp_id'];
    size = json['size'];
    container = json['container'];
    tagStatus = json['tag_status'];
    idSupplier = json['id_supplier'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    branchName = json['branch_name'];
    productName = json['product_name'];
    productCode = json['product_code'];
    salesMode = json['sales_mode'];
    fixedRateType = json['fixed_rate_type'];
    designName = json['design_name'];
    uom = json['uom'];
    taxType = json['tax_type'];
    supplier = json['supplier'];
    supplierShortCode = json['supplier_short_code'];
    supplierName = json['supplier_name'];
    purityName = json['purity_name'];
    metalName = json['metal_name'];
    metal = json['metal'];
    if (json['tag_images'] != null) {
      tagImages = <TagImages>[];
      json['tag_images'].forEach((v) {
        tagImages!.add(new TagImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag_id'] = this.tagId;
    if (this.stoneDetails != null) {
      data['stone_details'] =
          this.stoneDetails!.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    data['cat_id'] = this.catId;
    data['tax_id'] = this.taxId;
    data['weight_range'] = this.weightRange;
    data['purchase_date'] = this.purchaseDate;
    data['month_sup_code'] = this.monthSupCode;
    data['tag_code'] = this.tagCode;
    data['tag_date'] = this.tagDate;
    data['tag_pcs'] = this.tagPcs;
    data['tag_gwt'] = this.tagGwt;
    data['tag_lwt'] = this.tagLwt;
    data['tag_nwt'] = this.tagNwt;
    data['tag_stn_wt'] = this.tagStnWt;
    data['tag_dia_wt'] = this.tagDiaWt;
    data['tag_other_metal_wt'] = this.tagOtherMetalWt;
    data['tag_wastage_percentage'] = this.tagWastagePercentage;
    data['tag_wastage_wt'] = this.tagWastageWt;
    data['tag_mc_type'] = this.tagMcType;
    data['tag_mc_value'] = this.tagMcValue;
    data['tag_buy_rate'] = this.tagBuyRate;
    data['tag_sell_rate'] = this.tagSellRate;
    data['tag_tax_amount'] = this.tagTaxAmount;
    data['tag_item_cost'] = this.tagItemCost;
    data['tag_purchase_touch'] = this.tagPurchaseTouch;
    data['tag_purchase_va'] = this.tagPurchaseVa;
    data['tag_purchase_mc'] = this.tagPurchaseMc;
    data['tag_purchase_mc_type'] = this.tagPurchaseMcType;
    data['tag_purchase_calc_type'] = this.tagPurchaseCalcType;
    data['tag_pure_wt'] = this.tagPureWt;
    data['tag_purchase_rate'] = this.tagPurchaseRate;
    data['tag_purchase_rate_calc_type'] = this.tagPurchaseRateCalcType;
    data['tag_huid'] = this.tagHuid;
    data['tag_huid2'] = this.tagHuid2;
    data['tag_purchase_cost'] = this.tagPurchaseCost;
    data['is_partial_sale'] = this.isPartialSale;
    data['is_special_discount_applied'] = this.isSpecialDiscountApplied;
    data['flat_mc_value'] = this.flatMcValue;
    data['old_tag_code'] = this.oldTagCode;
    data['old_tag_id'] = this.oldTagId;
    data['is_imported'] = this.isImported;
    data['is_issued_to_counter'] = this.isIssuedToCounter;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['fin_year'] = this.finYear;
    data['id_branch'] = this.idBranch;
    data['tag_branch'] = this.tagBranch;
    data['tag_current_branch'] = this.tagCurrentBranch;
    data['tag_lot_inward_details'] = this.tagLotInwardDetails;
    data['tag_product_id'] = this.tagProductId;
    data['tag_design_id'] = this.tagDesignId;
    data['tag_sub_design_id'] = this.tagSubDesignId;
    data['tag_section_id'] = this.tagSectionId;
    data['tag_order_det'] = this.tagOrderDet;
    data['tag_purity_id'] = this.tagPurityId;
    data['tag_uom_id'] = this.tagUomId;
    data['tag_calculation_type'] = this.tagCalculationType;
    data['tag_tax_grp_id'] = this.tagTaxGrpId;
    data['size'] = this.size;
    data['container'] = this.container;
    data['tag_status'] = this.tagStatus;
    data['id_supplier'] = this.idSupplier;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['branch_name'] = this.branchName;
    data['product_name'] = this.productName;
    data['product_code'] = this.productCode;
    data['sales_mode'] = this.salesMode;
    data['fixed_rate_type'] = this.fixedRateType;
    data['design_name'] = this.designName;
    data['uom'] = this.uom;
    data['tax_type'] = this.taxType;
    data['supplier'] = this.supplier;
    data['supplier_short_code'] = this.supplierShortCode;
    data['supplier_name'] = this.supplierName;
    data['purity_name'] = this.purityName;
    data['metal_name'] = this.metalName;
    data['metal'] = this.metal;
    if (this.tagImages != null) {
      data['tag_images'] = this.tagImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StoneDetails {
  int? idTagStnDetail;
  int? stoneType;
  int? showInLwt;
  int? stonePcs;
  String? stoneWt;
  String? stoneRate;
  String? stoneAmount;
  int? stoneCalcType;
  int? tagId;
  int? idStone;
  Null? idQualityCode;
  int? uomId;
  String? stnCalcType;
  int? piece;
  String? weight;
  String? amount;
  String? stoneName;
  String? uomName;
  int? dividedByValue;
  Null? qualityCode;

  StoneDetails(
      {this.idTagStnDetail,
      this.stoneType,
      this.showInLwt,
      this.stonePcs,
      this.stoneWt,
      this.stoneRate,
      this.stoneAmount,
      this.stoneCalcType,
      this.tagId,
      this.idStone,
      this.idQualityCode,
      this.uomId,
      this.stnCalcType,
      this.piece,
      this.weight,
      this.amount,
      this.stoneName,
      this.uomName,
      this.dividedByValue,
      this.qualityCode});

  StoneDetails.fromJson(Map<String, dynamic> json) {
    idTagStnDetail = json['id_tag_stn_detail'];
    stoneType = json['stone_type'];
    showInLwt = json['show_in_lwt'];
    stonePcs = json['stone_pcs'];
    stoneWt = json['stone_wt'];
    stoneRate = json['stone_rate'];
    stoneAmount = json['stone_amount'];
    stoneCalcType = json['stone_calc_type'];
    tagId = json['tag_id'];
    idStone = json['id_stone'];
    idQualityCode = json['id_quality_code'];
    uomId = json['uom_id'];
    stnCalcType = json['stn_calc_type'];
    piece = json['piece'];
    weight = json['weight'];
    amount = json['amount'];
    stoneName = json['stone_name'];
    uomName = json['uom_name'];
    dividedByValue = json['divided_by_value'];
    qualityCode = json['quality_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tag_stn_detail'] = this.idTagStnDetail;
    data['stone_type'] = this.stoneType;
    data['show_in_lwt'] = this.showInLwt;
    data['stone_pcs'] = this.stonePcs;
    data['stone_wt'] = this.stoneWt;
    data['stone_rate'] = this.stoneRate;
    data['stone_amount'] = this.stoneAmount;
    data['stone_calc_type'] = this.stoneCalcType;
    data['tag_id'] = this.tagId;
    data['id_stone'] = this.idStone;
    data['id_quality_code'] = this.idQualityCode;
    data['uom_id'] = this.uomId;
    data['stn_calc_type'] = this.stnCalcType;
    data['piece'] = this.piece;
    data['weight'] = this.weight;
    data['amount'] = this.amount;
    data['stone_name'] = this.stoneName;
    data['uom_name'] = this.uomName;
    data['divided_by_value'] = this.dividedByValue;
    data['quality_code'] = this.qualityCode;
    return data;
  }
}

class TagImages {
  int? id;
  String? tagImage;
  bool? isDefault;
  int? erpTag;
  String? name;

  TagImages({this.id, this.tagImage, this.isDefault, this.erpTag, this.name});

  TagImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagImage = json['tag_image'];
    isDefault = json['is_default'];
    erpTag = json['erp_tag'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag_image'] = this.tagImage;
    data['is_default'] = this.isDefault;
    data['erp_tag'] = this.erpTag;
    data['name'] = this.name;
    return data;
  }
}
