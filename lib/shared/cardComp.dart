import 'package:flutter/material.dart';

Widget buildCardItem(service)=> Container(
  width: double.infinity,
  height: 150,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: Colors.grey),
  ),
  child: Row(
    children: [
      Container(
          width: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Image.network('${service['image']}',fit: BoxFit.cover,),
          )),
      VerticalDivider(color: Colors.grey,thickness: 2,),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name:${service['slug']}  ',maxLines: 2,overflow: TextOverflow.ellipsis),
            SizedBox(height: 5,),
            Expanded(child: Text('Address:${service['title']}',maxLines: 3,overflow: TextOverflow.ellipsis,)),
            SizedBox(height: 5,),
            Text('Price per hour:${service['id']}',maxLines: 1,),
            Align(
              child: TextButton(onPressed: (){},child: Text('Book Now'),),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
      ),


      


    ],
  ),
);