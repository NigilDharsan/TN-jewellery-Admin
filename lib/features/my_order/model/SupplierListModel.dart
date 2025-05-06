class SupplierListModel {
  List<SupplierListData>? data;

  SupplierListModel({this.data});

  SupplierListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SupplierListData>[];
      json['data'].forEach((v) {
        data!.add(new SupplierListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SupplierListData {
  int? idSupplier;
  int? isVendor;
  String? shortCode;
  String? supplierName;
  Null? supplierSign;
  String? address1;
  String? address2;
  String? address3;
  String? pincode;
  String? gstNumber;
  Null? panNumber;
  Null? phoneNo;
  String? mobileNo;
  String? mobCode;
  bool? status;
  int? cshOpBlc;
  int? metalOpBlc;
  int? silverOpBlc;
  int? noOfDaysForDue;
  Null? image;
  String? createdOn;
  String? updatedOn;
  int? idCountry;
  int? idState;
  int? idCity;
  int? createdBy;
  int? updatedBy;

  SupplierListData({
    this.idSupplier,
    this.isVendor,
    this.shortCode,
    this.supplierName,
    this.supplierSign,
    this.address1,
    this.address2,
    this.address3,
    this.pincode,
    this.gstNumber,
    this.panNumber,
    this.phoneNo,
    this.mobileNo,
    this.mobCode,
    this.status,
    this.cshOpBlc,
    this.metalOpBlc,
    this.silverOpBlc,
    this.noOfDaysForDue,
    this.image,
    this.createdOn,
    this.updatedOn,
    this.idCountry,
    this.idState,
    this.idCity,
    this.createdBy,
    this.updatedBy,
  });

  SupplierListData.fromJson(Map<String, dynamic> json) {
    idSupplier = json['id_supplier'];
    isVendor = json['is_vendor'];
    shortCode = json['short_code'];
    supplierName = json['supplier_name'];
    supplierSign = json['supplier_sign'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    pincode = json['pincode'];
    gstNumber = json['gst_number'];
    panNumber = json['pan_number'];
    phoneNo = json['phone_no'];
    mobileNo = json['mobile_no'];
    mobCode = json['mob_code'];
    status = json['status'];
    cshOpBlc = json['csh_op_blc'];
    metalOpBlc = json['metal_op_blc'];
    silverOpBlc = json['silver_op_blc'];
    noOfDaysForDue = json['no_of_days_for_due'];
    image = json['image'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    idCountry = json['id_country'];
    idState = json['id_state'];
    idCity = json['id_city'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_supplier'] = this.idSupplier;
    data['is_vendor'] = this.isVendor;
    data['short_code'] = this.shortCode;
    data['supplier_name'] = this.supplierName;
    data['supplier_sign'] = this.supplierSign;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['pincode'] = this.pincode;
    data['gst_number'] = this.gstNumber;
    data['pan_number'] = this.panNumber;
    data['phone_no'] = this.phoneNo;
    data['mobile_no'] = this.mobileNo;
    data['mob_code'] = this.mobCode;
    data['status'] = this.status;
    data['csh_op_blc'] = this.cshOpBlc;
    data['metal_op_blc'] = this.metalOpBlc;
    data['silver_op_blc'] = this.silverOpBlc;
    data['no_of_days_for_due'] = this.noOfDaysForDue;
    data['image'] = this.image;
    data['created_on'] = this.createdOn;
    data['updated_on'] = this.updatedOn;
    data['id_country'] = this.idCountry;
    data['id_state'] = this.idState;
    data['id_city'] = this.idCity;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;

    return data;
  }
}
