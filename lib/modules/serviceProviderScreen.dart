
import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        title: Text('Ship',style: TextStyle(color: Colors.black),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.blue,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                 decoration: BoxDecoration(
                   border:Border.all(color: Colors.grey) ,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  height: 170,
                 child: Image.asset('images/shipIcon.png',fit: BoxFit.fitHeight,),
                ),
              ),
              SizedBox(height: 20,),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index)=>buildCardItem(),
                  separatorBuilder: (context,index)=>SizedBox(height: 10,),
                  itemCount: 10),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildCardItem()=> Container(
    width: double.infinity,
    height: 110,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.grey),
    ),
    child: Row(
      children: [
        Image.asset('images/shipIcon.png',fit: BoxFit.cover,),
        VerticalDivider(color: Colors.grey,thickness: 2,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name:',),
            SizedBox(height: 5,),
            Text('Address:'),
            SizedBox(height: 5,),
            Text('Price per hour:'),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10,),
          child: Align(
            child: TextButton(onPressed: (){},child: Text('Book Now'),),
            alignment: Alignment.bottomRight,
          ),
        ),

      ],
    ),
  );
}
