import 'package:booking/layout/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/remote/dio-helper.dart';
class homeCubit extends Cubit<serviceStates>{
  homeCubit():super(serviceIntialState());
  static homeCubit get(context) => BlocProvider.of(context);
  var id;
  List<dynamic> service =[];
  void getService(){
    emit(getServiceLoadingState());
    dioHelper
        .getData(url:'posts/',query: { 'id': id} )
        .then((value){
      service=value.data;
      print(service[0]);
      print('يااااااااااااااااااااااااااااااااااااااااااااااااااااري');

      emit(getServiceSucessState());
    })
        .catchError((error){
      print(error.toString());
      emit(getServiceErrorState(error));
    });
  }
}