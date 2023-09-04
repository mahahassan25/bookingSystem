
import 'package:booking/layout/cubit.dart';
import 'package:booking/layout/homeScreen.dart';
import 'package:booking/modules/register/signup.dart';
import 'package:booking/modules/signin/signin.dart';
import 'package:booking/remote/dio-helper.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            home: signinScreen()
          ));
    }
  }

