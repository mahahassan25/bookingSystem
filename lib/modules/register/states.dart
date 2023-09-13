abstract class registerStates{}
class registerInitalState extends registerStates{}
class textIsNotHidden extends registerStates{}

class regiterLoadingState extends registerStates{}
class regiterSucessState extends registerStates{}
class regiterErrorState extends registerStates{
  final String error;
  regiterErrorState(this.error);
}
class CreateUserSucessState extends registerStates{
  final String uid;
  CreateUserSucessState(this.uid);
}
class CreateUserErrorState extends registerStates{}