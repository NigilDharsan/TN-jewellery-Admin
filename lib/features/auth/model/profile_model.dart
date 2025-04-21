class ProfileData {
  String? id;
  String? firstname;
  String? lastname;
  String? mobile;
  String? email;
  String? gender;


  ProfileData(
      {this.id,
      this.firstname,
      this.lastname,
      this.mobile,
        this.gender,
      this.email});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['c_id'];
    firstname = json['name'];
    lastname = json['name'];
    mobile = json['mobileno'];
    email = json['email'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.firstname;
    data['name'] = this.lastname;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['gender'] = this.gender;
    return data;
  }
}
