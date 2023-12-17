
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
    return RefreshIndicator(
      color: basicColor,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,


      onRefresh: () {
        return refresh();
      },
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  width:double.infinity,
                  child: BuildFormField(controller:searchController ,
                    inputType: TextInputType.text,
                    validator: (value){
                      return null;
                    },
                    label: 'Search Med',
                    prefix: Icons.search,),
                ),
                SizedBox(height: 20,),
                ItemsList()
              ],
            )
        ),
      ),
    );
}
   Widget BuildCatigories()
   {
     return Column(
       children: [
         CircleAvatar(
           backgroundColor: basicColor,
           radius: 30,
         ),
         SizedBox(height: 10,),
         Text('UntiBioteq',
           style: TextStyle(
               fontSize: 10
           ),)
       ],
     );
   }
   Future<void>refresh()
   async {
    ItemsList();
     return Future.delayed(
         Duration(
             milliseconds: 100
         )
     );
   }
}
