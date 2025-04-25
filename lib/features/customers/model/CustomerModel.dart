class CustomerModel {
  List<Data>? data;
  String? message;

  CustomerModel({this.data, this.message});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? gender;
  Null? image;
  String? imageText;
  int? sno;
  int? pkId;
  int? idCustomer;
  String? email;
  Null? referenceNo;
  String? name;
  String? dateAdd;
  String? title;
  Null? dateOfBirth;
  String? firstname;
  String? lastname;
  Null? empRefCode;
  String? mobCode;
  List<Null>? previewImages;
  bool? isChecked;
  String? mobile;
  String? mobileWoc;
  String? areaName;

  Data(
      {this.gender,
      this.image,
      this.imageText,
      this.sno,
      this.pkId,
      this.idCustomer,
      this.email,
      this.referenceNo,
      this.name,
      this.dateAdd,
      this.title,
      this.dateOfBirth,
      this.firstname,
      this.lastname,
      this.empRefCode,
      this.mobCode,
      this.previewImages,
      this.isChecked,
      this.mobile,
      this.mobileWoc,
      this.areaName});

  Data.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    image = json['image'];
    imageText = json['image_text'];
    sno = json['sno'];
    pkId = json['pk_id'];
    idCustomer = json['id_customer'];
    email = json['email'];
    referenceNo = json['reference_no'];
    name = json['name'];
    dateAdd = json['date_add'];
    title = json['title'];
    dateOfBirth = json['date_of_birth'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    empRefCode = json['emp_ref_code'];
    mobCode = json['mob_code'];

    isChecked = json['isChecked'];
    mobile = json['mobile'];
    mobileWoc = json['mobile_woc'];
    areaName = json['area_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['image'] = this.image;
    data['image_text'] = this.imageText;
    data['sno'] = this.sno;
    data['pk_id'] = this.pkId;
    data['id_customer'] = this.idCustomer;
    data['email'] = this.email;
    data['reference_no'] = this.referenceNo;
    data['name'] = this.name;
    data['date_add'] = this.dateAdd;
    data['title'] = this.title;
    data['date_of_birth'] = this.dateOfBirth;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['emp_ref_code'] = this.empRefCode;
    data['mob_code'] = this.mobCode;

    data['isChecked'] = this.isChecked;
    data['mobile'] = this.mobile;
    data['mobile_woc'] = this.mobileWoc;
    data['area_name'] = this.areaName;
    return data;
  }
}
