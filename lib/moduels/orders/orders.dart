
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/shared/components/form_field.dart';
import 'package:medixify/shared/components/itemslist.dart';
import 'package:medixify/shared/style/colors.dart';

class OrdersScreen extends StatelessWidget {
   OrdersScreen({super.key});
   var searchController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    MedixifyCubit.get(context).GetOrder();
    return RefreshIndicator(
      color: basicColor,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,


      onRefresh: () {
        return refresh(context);
      },
      child: BlocConsumer<MedixifyCubit,MedixifyStates>(
        listener: (context,state){},

        builder: (context,state){
          return  ConditionalBuilder(condition:MedixifyCubit.get(context).orderModel!=null ,
              builder: (context)=>SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        SizedBox(height: 20,),
                        ItemsList(model: MedixifyCubit.get(context).orderModel!,)
                      ],
                    )
                ),
              ),
              fallback:(context)=> Center(
          child: CircularProgressIndicator()));
        },
      ),
    );
}

   Future<void>refresh(context)
   async {
   MedixifyCubit.get(context).GetOrder();
     return Future.delayed(
         Duration(
             milliseconds: 100
         )
     );
   }
}
