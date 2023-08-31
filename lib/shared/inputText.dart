import 'package:flutter/material.dart';

inputText({
  required TextEditingController? controller,
  required TextInputType? type,
  required String? validator,
  required String? label,
  IconData ?suffixicon,
  bool  ispass= false,
  void Function()?suffixfunc,
}) => TextFormField(
controller:controller ,
  keyboardType:type ,
  validator: (String ? value){
  if(value!.isEmpty || value.trim().isEmpty){
    return  validator;
  }
  },
  obscureText: ispass,
  decoration: InputDecoration(
    focusColor: Colors.blue,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.grey),
    ),
    labelText: label,
    suffixIcon: IconButton(
        onPressed: suffixfunc,
        icon: Icon(suffixicon),color: Colors.blueAccent,),
  ),
);


