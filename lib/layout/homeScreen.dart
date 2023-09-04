import 'package:booking/layout/cubit.dart';
import 'package:booking/layout/states.dart';
import 'package:booking/modules/serviceProviderScreen.dart';
import 'package:booking/shared/serviceComp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homeCubit,serviceStates>(
        listener: (context,state){},
        builder: (context,state){
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
                            context: context,
                           id:1,
                        )),
                        SizedBox(width: 10,),
                        Expanded(child: service(
                            url: 'images/truckIcon.png',
                            name: 'Truck',
                            context: context,
                          id:2,
                        )),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(child: service(
                          url: 'images/service.jpg',
                          name:'Service',
                            context: context,
                          id: 3
                        )),
                        SizedBox(width: 10,),
                        Expanded(child: service(
                          url: 'images/service.jpg',
                          name: 'Service',
                            context: context,
                          id:4
                        )),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(child: service(
                          url: 'images/service.jpg',
                          name:'Service',
                            context: context,
                          id:5
                        )),
                        SizedBox(width: 10,),
                        Expanded(child: service(
                          url: 'images/service.jpg',
                          name: 'Service',
                            context: context,
                          id:6
                        )),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(child: service(
                          url: 'images/service.jpg',
                          name:'Service',
                            context: context,
                          id:7
                        )),
                        SizedBox(width: 10,),
                        Expanded(child: service(
                          url: 'images/service.jpg',
                          name: 'Service',
                            context: context,
                          id:8
                        )),
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          );
        },
        );
  }
}
