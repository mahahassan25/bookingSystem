import 'package:booking/layout/homeScreen.dart';
import 'package:booking/modules/signup.dart';
import 'package:booking/shared/buttonTextcomp.dart';
import 'package:booking/shared/inputText.dart';
import 'package:flutter/material.dart';

class signinScreen extends StatefulWidget {
  const signinScreen({super.key});

  @override
  State<signinScreen> createState() => _signinScreenState();
}

class _signinScreenState extends State<signinScreen> {
  var emailController= TextEditingController();
  var passController= TextEditingController();
  var formKey=GlobalKey<FormState>();
  bool hidden=true;
  @override
  Widget build(BuildContext context) {
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
                  ispass: hidden,
                  suffixfunc: (){
                   setState(() {
                     hidden=!hidden;
                   });
                  },
                  suffixicon: hidden? Icons.visibility_off : Icons.visibility
                ),
                SizedBox(height: 3,),
                buttonText(onpressed: (){}, title: 'Forgot Password?'),
                SizedBox(height: 30,),
                Container(
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
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const homeScreen()));
                      }
                    },
                    child: Text('Sign In',style: TextStyle(color: Colors.white),),
                  ),
                ),
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
  }
}

