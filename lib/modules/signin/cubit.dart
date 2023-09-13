import 'package:booking/modules/signin/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signInCubit extends Cubit<signInStates>{
  signInCubit() : super(signInInitialStates());
  static signInCubit get(context) => BlocProvider.of(context);
  bool hidden=true;
  void obscureText(){
    hidden=!hidden;
    emit(TextIsNotHidden());
  }
  void userLogIn({
    required String email,
    required String password
}){
    emit(signInLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password).then(
            (value) {
              emit(signInSucessState(value.user!.uid));
              print('ggggggggggggggggggggggggggdddddddddddddddddddddddddddddddddddddddd');
              print(value.user!.email);
            }).catchError(
        (error){
          emit(signInErrorState(error.toString()));
          print(error.toString());
        });
}
}