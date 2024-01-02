
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/blocs/app_cubit/common_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/shared/components/items_grid.dart';
import 'package:medixify/shared/style/colors.dart';

import '../../shared/components/form_field.dart';

class CatigoriesScreen extends StatelessWidget {
  CatigoriesScreen({super.key,this.name});

  String?name;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<MedixifyCubit,MedixifyStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
              leading: IconButton(onPressed: (){

                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back_ios)),
              title:
              Text ( name!,
                style: TextStyle(
                    color: basicColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),)
          ),
          body: ConditionalBuilder(
            condition: state is LoadingSearchState,
            builder:(context)=> Center(
                child:CircularProgressIndicator() ,


            ) ,
            fallback:(context)=> SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        SizedBox(height: 20,),
                        ItemsGrid(model: MedixifyCubit.get(context).searchModel,),


                      ],
                    )
                ),
              ),
            ),

        );
      }

    );
  }
}
