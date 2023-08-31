import 'package:flutter/material.dart';
buttonText({
  required void Function() ? onpressed,
  required String?title
}) => TextButton(
    onPressed: onpressed,
    child:Text('${title}',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),) );
button({
  required String title,
  required void Function() function,
  required BuildContext context,

}) => Container(
  width: MediaQuery.of(context).size.width,
  height: 50,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.blueAccent,
  ),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: MaterialButton(
    onPressed: function,
    child: Text('${title}',style: TextStyle(color: Colors.white),),
  ),
);