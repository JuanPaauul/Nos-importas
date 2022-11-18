class UserModel {
  String uid = "";
  String displayName;
  String email;
  int phoneNumber;
  String province;
  String city;

  UserModel(this.uid, this.displayName, this.email, this.phoneNumber,
      this.province, this.city);

  bool hasData() {
    return uid == "";
  }
}
