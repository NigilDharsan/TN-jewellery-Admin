class AccountModel {
  String? token;
  String? loginExpiry;
  bool? redirect;
  Employee? employee;
  Preferences? preferences;

  AccountModel(
      {this.token,
      this.loginExpiry,
      this.redirect,
      this.employee,
      this.preferences});

  AccountModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    loginExpiry = json['login_expiry'];
    redirect = json['redirect'];
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    preferences = json['preferences'] != null
        ? new Preferences.fromJson(json['preferences'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['login_expiry'] = this.loginExpiry;
    data['redirect'] = this.redirect;
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    if (this.preferences != null) {
      data['preferences'] = this.preferences!.toJson();
    }
    return data;
  }
}

class Employee {
  int? idEmployee;
  Null? email;
  bool? emailVerified;
  String? mobCode;
  int? idBranch;
  Null? lastname;
  String? firstname;
  Null? dateOfBirth;
  String? empCode;
  Null? dateOfJoin;
  String? mobile;
  Null? image;
  Null? signature;
  Null? comments;
  bool? isDeveloper;
  bool? isSystemUser;
  String? dateAdd;
  Null? dateUpd;
  String? address1;
  Null? address2;
  Null? address3;
  String? pincode;
  int? user;
  int? dept;
  int? designation;
  int? idProfile;
  int? empType;
  int? country;
  int? state;
  int? city;
  int? area;

  Employee({
    this.idEmployee,
    this.email,
    this.emailVerified,
    this.mobCode,
    this.idBranch,
    this.lastname,
    this.firstname,
    this.dateOfBirth,
    this.empCode,
    this.dateOfJoin,
    this.mobile,
    this.image,
    this.signature,
    this.comments,
    this.isDeveloper,
    this.isSystemUser,
    this.dateAdd,
    this.dateUpd,
    this.address1,
    this.address2,
    this.address3,
    this.pincode,
    this.user,
    this.dept,
    this.designation,
    this.idProfile,
    this.empType,
    this.country,
    this.state,
    this.city,
    this.area,
  });

  Employee.fromJson(Map<String, dynamic> json) {
    idEmployee = json['id_employee'];
    email = json['email'];
    emailVerified = json['email_verified'];
    mobCode = json['mob_code'];
    idBranch = json['id_branch'];
    lastname = json['lastname'];
    firstname = json['firstname'];
    dateOfBirth = json['date_of_birth'];
    empCode = json['emp_code'];
    dateOfJoin = json['date_of_join'];
    mobile = json['mobile'];
    image = json['image'];
    signature = json['signature'];
    comments = json['comments'];
    isDeveloper = json['is_developer'];
    isSystemUser = json['is_system_user'];
    dateAdd = json['date_add'];
    dateUpd = json['date_upd'];
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    pincode = json['pincode'];
    user = json['user'];
    dept = json['dept'];
    designation = json['designation'];
    idProfile = json['id_profile'];
    empType = json['emp_type'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_employee'] = this.idEmployee;
    data['email'] = this.email;
    data['email_verified'] = this.emailVerified;
    data['mob_code'] = this.mobCode;
    data['id_branch'] = this.idBranch;
    data['lastname'] = this.lastname;
    data['firstname'] = this.firstname;
    data['date_of_birth'] = this.dateOfBirth;
    data['emp_code'] = this.empCode;
    data['date_of_join'] = this.dateOfJoin;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['signature'] = this.signature;
    data['comments'] = this.comments;
    data['is_developer'] = this.isDeveloper;
    data['is_system_user'] = this.isSystemUser;
    data['date_add'] = this.dateAdd;
    data['date_upd'] = this.dateUpd;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    data['pincode'] = this.pincode;
    data['user'] = this.user;
    data['dept'] = this.dept;
    data['designation'] = this.designation;
    data['id_profile'] = this.idProfile;
    data['emp_type'] = this.empType;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['area'] = this.area;
    return data;
  }
}

class Preferences {
  List<int>? loginBranches;
  String? idCompany;
  String? companyName;
  int? companyCountry;
  int? empId;

  Preferences(
      {this.loginBranches,
      this.idCompany,
      this.companyName,
      this.companyCountry,
      this.empId});

  Preferences.fromJson(Map<String, dynamic> json) {
    loginBranches = json['login_branches'].cast<int>();
    idCompany = json['id_company'];
    companyName = json['company_name'];
    companyCountry = json['company_country'];
    empId = json['emp_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login_branches'] = this.loginBranches;
    data['id_company'] = this.idCompany;
    data['company_name'] = this.companyName;
    data['company_country'] = this.companyCountry;
    data['emp_id'] = this.empId;
    return data;
  }
}
