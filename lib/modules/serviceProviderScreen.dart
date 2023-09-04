
import 'package:booking/layout/cubit.dart';
import 'package:booking/layout/states.dart';
import 'package:booking/shared/cardComp.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceScreen extends StatelessWidget {
  final String ? image;
  final int? id;
  ServiceScreen(this.image,this.id);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<homeCubit,serviceStates>(
      listener: (context,state){},
      builder:(context,state) {
        homeCubit.get(context).id=id;
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
                   child: Image.asset('${image}',fit: BoxFit.fitHeight,),
                  ),
                ),
                SizedBox(height: 20,),
                ConditionalBuilder(
                  condition:state is! getServiceLoadingState ,
                 builder:(context)=> ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index)=>buildCardItem(homeCubit.get(context).service[index]),
                      separatorBuilder: (context,index)=>SizedBox(height: 10,),
                      itemCount: 10),
                fallback: (context)=> Center(child: CircularProgressIndicator()),
                ),

              ],
            ),
          ),
        ),
      );},
    );
  }

}
