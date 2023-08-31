import 'package:booking/layout/homeScreen.dart';
import 'package:booking/shared/buttonTextcomp.dart';
import 'package:booking/shared/iconTextButtton.dart';
import 'package:booking/shared/inputText.dart';
import 'package:flutter/material.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  var emailController=TextEditingController();
  var phoneController=TextEditingController();
  var passController=TextEditingController();
  var firstNameController=TextEditingController();
  var lastNameController=TextEditingController();
  var formKey= GlobalKey<FormState>();
  bool hidden=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.blue,),
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
                Text('Sign up',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 30,),
                inputText(
                    controller: emailController,
                    type: TextInputType.text,
                    validator: 'Email must not be empty',
                    label: 'Email Address'),
                SizedBox(height: 10,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: inputText(
                        controller: firstNameController,
                        type: TextInputType.name,
                        validator: 'name must not be empty',
                        label: 'First Name'),),
                  SizedBox(width: 10,),
                  Expanded(child: inputText(
                      controller: lastNameController,
                      type: TextInputType.name,
                      validator: 'name must not be empty',
                      label: 'Last Name'),) ,
                  ],
                ),
                SizedBox(height: 10,),
                inputText(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validator: 'phone must not be empty',
                    label: 'phone number'),
                SizedBox(height: 10,),
                inputText(
                    controller: passController,
                    type: TextInputType.visiblePassword,
                    validator: 'password must not be empty',
                    label: 'Password',
                    ispass: true,
                  suffixicon: hidden? Icons.visibility_off : Icons.visibility,
                 suffixfunc: (){
                      setState(() {
                        hidden=!hidden;
                      });
                 }
                ),
                SizedBox(height: 20,),
                button(
                  context: context,
                    title: 'Sign up',
                    function: (){
                      if(formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const homeScreen()));
                      }
                    }),
                SizedBox(height: 20,),
                Center(child: Text('or sign up with social accounts',style: TextStyle(color: Colors.grey),)),
                SizedBox(height: 20,),
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
                        function: (){}),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: iconTextButton(
                        background: Colors.white,
                        iconp: Icons.facebook,
                        text: 'Facbook',
                        iconColor: Colors.blue,
                        textColor: Colors.blue,
                        context: context,
                        function: (){}),
                  ),
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
