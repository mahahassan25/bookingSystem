abstract class serviceStates{}
class serviceIntialState extends serviceStates{}
class getServiceLoadingState extends serviceStates{}
class getServiceSucessState extends serviceStates{}
class getServiceErrorState extends serviceStates{
  final String error;
  getServiceErrorState(this.error);
}