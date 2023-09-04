
class userModel{
  late String name;
  late String phone;
  late String email;
  late String uid;
  userModel(
      this.name,
      this.email,
      this.phone,
      this.uid,
  );
   userModel.fromJason(Map<String,dynamic> jason){
     name=jason['name'];
     phone=jason['phone'];
     email=jason['email'];
     uid=jason['uid'];
   }
   Map<String,dynamic> toMap(){
     return{
       'name':name,
       'email':email,
       'phone':phone,
       'uid':uid,
     };
   }
}