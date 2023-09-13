
import 'package:booking/layout/cubit.dart';
import 'package:booking/layout/homeScreen.dart';
import 'package:booking/modules/register/signup.dart';
import 'package:booking/modules/signin/signin.dart';
import 'package:booking/remote/dio-helper.dart';
import 'package:booking/remote/sharedPref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  dioHelper.initl();
  await casheHelper.init();
  var uid=casheHelper.getData(key: 'uid');
  Widget startScreen;
  if(uid == null){
    startScreen = signinScreen();
  }
  else
    {
      startScreen= homeScreen();
    }
  runApp( MyApp(startScreen));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;
  MyApp(this.startScreen);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


      return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) {
              return homeCubit()..getService()
              ;
            }),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: startScreen
          ));
    }
  }

