class UserModal {
  String? email;
  String? firstname;
  String? lastname;

  UserModal({
    this.email,
    this.firstname,
    this.lastname,
  });

  factory UserModal.formJson(Map<String, dynamic> json) {
    return UserModal(
      email: json['email'],
      firstname: json['firstName'],
      lastname: json['lastName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstName": firstname,
      "lastName": lastname,
    };
  }

  UserModal copyWith({
    String? email,
    String? firstname,
    String? lastname,
  }) {
    return UserModal(
      email: email ?? this.email,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
    );
  }
}
