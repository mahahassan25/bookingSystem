import 'package:booking/model/userModel.dart';
import 'package:booking/modules/register/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
class registerCubit extends Cubit<registerStates> {
  registerCubit() :super(registerInitalState());

  static registerCubit get(context) => BlocProvider.of(context);
  bool hidden = true;

  void obscureText() {
    hidden = !hidden;
    emit(textIsNotHidden());
  }

  void createUser({
    required String email,
    required String name,
    required String phone,
    required String uid,
  }) {
    userModel model = userModel(
        name = name,
        email = email,
        phone = phone,
        uid = uid);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSucessState());
    })
        .catchError((error) {
      emit(CreateUserErrorState());
    });
  }

  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String pass,
  }) {
    emit(regiterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass).then(
            (value) {
          createUser(
              email: email,
              name: name,
              phone: phone,
              uid: value.user!.uid);
          print(value.user!.email);
        }).catchError((error) {
      emit(regiterErrorState(error.toString()));
      print(error.toString());
    });
  }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,

      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);
        user = userCredential.user;
        createUser(email: googleSignInAccount.email, name: googleSignInAccount.displayName!, phone: '0x00000000', uid: googleSignInAccount.id);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Get.showSnackbar(const GetSnackBar(
            message: "You already have an account with this email. Use other login method.",
            duration: Duration(seconds: 3),
          ));
        }
        else if (e.code == 'invalid-credential') {
          Get.showSnackbar(const GetSnackBar(
            message: "Invalid Credential!",
            duration: Duration(seconds: 3),
          ));
        } else if (e.code == 'wrong-password') {
          Get.showSnackbar(const GetSnackBar(
            message: "Wrong password!",
            duration: Duration(seconds: 3),
          ));
        }
      } catch (e) {
        Get.showSnackbar(const GetSnackBar(
          message: "Unknown Error. Try again later",
          duration: Duration(seconds: 3),
        ));
      }
    }

    return user;
  }

}
