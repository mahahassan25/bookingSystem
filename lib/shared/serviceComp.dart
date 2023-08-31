import 'package:flutter/material.dart';

service({
  required String name,
  required String url,
  void Function()?ontap,

})=> GestureDetector(
  onTap: ontap,
  child:   Container(

      height: 150,

      width: double.infinity,

      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(5),

          border: Border.all(color: Colors.grey)

      ),

      child:  Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Container(

              height:100,

              child: Image.asset('${url}',fit: BoxFit.cover,)),

          SizedBox(height: 10,),

          Text('${name}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)

        ],

      )





  ),
);