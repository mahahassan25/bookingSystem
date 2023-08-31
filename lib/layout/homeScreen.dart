import 'package:booking/modules/serviceProviderScreen.dart';
import 'package:booking/modules/truckService.dart';
import 'package:booking/shared/serviceComp.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.white,
        leading: IconButton(onPressed: (){},icon: Icon(Icons.menu,color: Colors.blue,),),
        title: Center(
          child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search..',
                  border: InputBorder.none
                ),
              ),
            )
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: service(
                    url: 'images/shipIcon.png',
                    name:'Ship',
                    ontap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ServiceScreen()));
                    }
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: service(
                    url: 'images/truckIcon.png',
                    name: 'Truck',
                    ontap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TruckServiceScreen()));
                    }
                  )),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: service(
                      url: 'images/service.jpg',
                      name:'Service',

                  )),
                  SizedBox(width: 10,),
                  Expanded(child: service(
                      url: 'images/service.jpg',
                      name: 'Service',

                  )),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: service(
                    url: 'images/service.jpg',
                    name:'Service',

                  )),
                  SizedBox(width: 10,),
                  Expanded(child: service(
                    url: 'images/service.jpg',
                    name: 'Service',

                  )),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(child: service(
                    url: 'images/service.jpg',
                    name:'Service',

                  )),
                  SizedBox(width: 10,),
                  Expanded(child: service(
                    url: 'images/service.jpg',
                    name: 'Service',

                  )),
                ],
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
