abstract class signInStates {}
class signInInitialStates extends signInStates{}
class TextIsNotHidden extends signInStates{}
class signInLoadingState extends signInStates{}
class signInSucessState extends signInStates{
  final String uid;
  signInSucessState(this.uid);
}
class signInErrorState extends signInStates{
  final String error;
  signInErrorState(this.error);
}