class UserModal {
  String? email;
  String? firstname;
  String? lastname;
  String? mobile;
  String? photo;

  UserModal.formJson(Map<String, dynamic> json) {
    email = json["email"];
    firstname = json["firstName"];
    lastname = json["lastName"];
    mobile = json["mobile"];
    photo = json["photo"];
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstName": firstname,
      "lastName": lastname,
      "mobile": mobile,
      "photo": photo,
    };
  }
}
