class UserModel {
  String ? email;
  String ?firstName;
  String ?lastName;
  String ?mobile;
  String ?photo;
  UserModel.formJson(Map<String,dynamic> json){
    print("USER JSON => $json");
    email =json["email"];
    firstName=json["firstName"];
    lastName=json["lastName"];
    mobile=json["mobile"];
    photo=json["photo"];
  }
  Map<String,dynamic> toJson(){
     return{
       "email":email,
       "firstName":firstName,
       "lastName":lastName,
       "mobile":mobile,
       "photo":photo
     };
  }
}