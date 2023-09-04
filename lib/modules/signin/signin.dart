

import 'package:booking/layout/homeScreen.dart';
import 'package:booking/modules/signin/cubit.dart';
import 'package:booking/modules/signin/states.dart';
import 'package:booking/modules/register/signup.dart';
import 'package:booking/shared/buttonTextcomp.dart';
import 'package:booking/shared/inputText.dart';
import 'package:booking/shared/toaster.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signinScreen extends StatelessWidget {
  const signinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController= TextEditingController();
    var passController= TextEditingController();
    var formKey=GlobalKey<FormState>();

    return BlocProvider(
        create: ( context)=>signInCubit(),
        child:BlocConsumer<signInCubit,signInStates>(
        listener: (context,state){
          if(state is signInErrorState){
            showToast(text: state.error, state: ToastStates.error);
          }
          if(state is signInSucessState){
            showToast(text: 'you have sucessfuly loged in', state: ToastStates.correct);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> homeScreen()));
          }
            
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sign in',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 30),),
                      SizedBox(height: 10,),
                      Text('Welcome back! Please enter your details',style: TextStyle(color: Colors.black),),
                      SizedBox(height: 30,),
                      inputText(
                        controller: emailController,
                        type: TextInputType.text,
                        validator: 'email must not be empty',
                        label: 'Email Address',
                      ),
                      SizedBox(height: 20,),
                      inputText(
                          controller: passController,
                          type: TextInputType.text,
                          validator: 'password must not be empty',
                          label: 'Password',
                          ispass: signInCubit.get(context).hidden,
                          suffixfunc: (){
                            signInCubit.get(context).obscureText();
                          },
                          suffixicon: signInCubit.get(context).hidden? Icons.visibility_off : Icons.visibility
                      ),
                      SizedBox(height: 3,),
                      buttonText(onpressed: (){}, title: 'Forgot Password?'),
                      SizedBox(height: 30,),
                      ConditionalBuilder(
                          condition: state is! signInLoadingState,
                          builder: (context)=>Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blueAccent,
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: MaterialButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  signInCubit.get(context).userLogIn(
                                      email: emailController.text,
                                      password: passController.text);
                                }
                              },
                              child: Text('Sign In',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          fallback:(context)=> Center(child: CircularProgressIndicator())),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",style: TextStyle(color: Colors.black),),
                          buttonText(onpressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const signupScreen()));
                          }, title: 'Sign Up!')

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
    },
    ) ,
    );
  }
}

