import 'package:booking/layout/homeScreen.dart';
import 'package:booking/modules/register/cubit.dart';
import 'package:booking/modules/register/states.dart';
import 'package:booking/shared/buttonTextcomp.dart';
import 'package:booking/shared/iconTextButtton.dart';
import 'package:booking/shared/inputText.dart';
import 'package:booking/shared/toaster.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signupScreen extends StatelessWidget {
  const signupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var passController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => registerCubit(),
      child: BlocConsumer<registerCubit, registerStates>(
        listener: (context, state) {
          if(state is regiterErrorState){
            showToast(text: state.error, state: ToastStates.error);
          }
          if(state is CreateUserSucessState){
             Navigator.push(
                context,
               MaterialPageRoute(
                 builder: (context) =>
                 const homeScreen()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      inputText(
                          controller: emailController,
                          type: TextInputType.text,
                          validator: 'Email must not be empty',
                          label: 'Email Address'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: inputText(
                                controller: firstNameController,
                                type: TextInputType.name,
                                validator: 'name must not be empty',
                                label: 'First Name'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: inputText(
                                controller: lastNameController,
                                type: TextInputType.name,
                                validator: 'name must not be empty',
                                label: 'Last Name'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      inputText(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validator: 'phone must not be empty',
                          label: 'phone number'),
                      SizedBox(
                        height: 10,
                      ),
                      inputText(
                          controller: passController,
                          type: TextInputType.visiblePassword,
                          validator: 'password must not be empty',
                          label: 'Password',
                          ispass:registerCubit.get(context).hidden ,
                          suffixicon: registerCubit.get(context).hidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixfunc: () {
                            registerCubit.get(context).obscureText();
                          }),
                      SizedBox(
                        height: 20,
                      ),
                     ConditionalBuilder(
                         condition: state is! regiterLoadingState,
                         builder:(context)=> button(
                             context: context,
                             title: 'Sign up',
                             function: () {
                               if (formKey.currentState!.validate()) {
                                 registerCubit.get(context).userRegister(
                                     email: emailController.text,
                                     name: '${firstNameController.text} ${lastNameController.text}',
                                     phone: phoneController.text,
                                     pass: passController.text);
                               }
                             }),
                         fallback:(context)=>Center(child: const CircularProgressIndicator(color: Colors.blue,))),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        'or sign up with social accounts',
                        style: TextStyle(color: Colors.grey),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: iconTextButton(
                                background: Colors.white,
                                iconp: Icons.g_mobiledata,
                                text: 'Google',
                                context: context,
                                iconColor: Colors.blue,
                                textColor: Colors.blue,
                                function: () async{
                                  User?user;
                                user=await  registerCubit.get(context).signInWithGoogle();
                                if(user != null){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>homeScreen()));
                                }
                                }),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: iconTextButton(
                                background: Colors.white,
                                iconp: Icons.facebook,
                                text: 'Facbook',
                                iconColor: Colors.blue,
                                textColor: Colors.blue,
                                context: context,
                                function: () {}),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
