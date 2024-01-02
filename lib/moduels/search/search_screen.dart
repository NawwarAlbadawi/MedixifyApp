import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/shared/components/form_field.dart';

import '../../generated/l10n.dart';
import '../../layout/medixify/cubit/app_cubit.dart';
import '../../shared/components/items_grid.dart';
import '../../shared/style/colors.dart';
class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
  var searchController= TextEditingController();
  @override
  Widget build(BuildContext context) {

    return  SafeArea(
        child: BlocConsumer<MedixifyCubit,MedixifyStates>(
      listener:(context,state){},
      builder:(context,state){
        return Scaffold(
          appBar:AppBar(
            title: Text(
              '${S.of(context).Search}',
              style: TextStyle(
                  fontSize: 30,
                  color: basicColor,
                  fontWeight: FontWeight.bold
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){

                Navigator.pop(context);
              },
            ),
          ),
          body:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    BuildFormField(
                      controller:searchController ,
                      inputType: TextInputType.text,
                      validator: (value){
                        return null;
                      },
                      label: S.of(context).search_med,
                      prefix: Icons.search,
                      Autofocus: true,
                      onChanged: (value){

                        MedixifyCubit.get(context).Search(
                            name: value
                        );
                      },
                      radius: 30,
                    ),
                    SizedBox(height: 40,),

                    ItemsGrid(model:  MedixifyCubit.get(context).searchModel,),




                  ],
                )
            ),
          )
        );
      }

    ));
  }
}
