
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/shared/components/items_grid.dart';
import 'package:medixify/shared/components/itemslist.dart';

import '../../layout/medixify/cubit/app_cubit.dart';
import '../../layout/medixify/cubit/app_states.dart';
import '../../shared/components/form_field.dart';
import '../../shared/style/colors.dart';

class FavoritesScreen extends StatelessWidget {
   FavoritesScreen({super.key});
  var searchController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<MedixifyCubit,MedixifyStates>(
        listener: (context,states){},
        builder: (context,states){

          return RefreshIndicator(
            color: basicColor,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () {
              return refresh();
            },
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(

                        child: BuildFormField(controller:searchController ,
                          inputType: TextInputType.text,
                          validator: (value){
                            return null;
                          },
                          label: 'Search Med',
                          prefix: Icons.search,),
                      ),
                      SizedBox(height: 20,),
                        ItemsGrid(medname: 'nawwar',
                            medprice: '1233',),








                    ],
                  )
              ),
            ),
          );
        }
    );
  }
   Future<void>refresh()
   async {
     return Future.delayed(
         Duration(
             milliseconds: 1000
         )
     );
   }
}
