


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/moduels/catigories/catigories.dart';
import 'package:medixify/shared/components/MatrialButton.dart';
import 'package:medixify/shared/components/form_field.dart';
import 'package:medixify/shared/components/items_grid.dart';
import 'package:medixify/shared/components/navigator.dart';
import 'package:medixify/shared/components/refresh.dart';
import 'package:medixify/shared/style/colors.dart';

import '../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   var searchController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedixifyCubit,MedixifyStates>(
        listener: (context,states){},
        builder: (context,states){

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
                      mainAxisSize: MainAxisSize.min,

                      children: [


                        Row(
                          children: [
                            Container(
                              width: 290,
                              child: BuildFormField(controller:searchController ,
                                inputType: TextInputType.text,
                                validator: (value){
                                  return null;
                                },
                                label: S.of(context).search_med,
                                prefix: Icons.search,),
                            ),
                            Spacer(),
                            IconButton(onPressed: (){},
                                icon: Icon(Icons.shopping_bag_outlined))
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 90 ,
                          child: ListView.separated(itemBuilder:(context,index)=> BuildCatigories(context),
                            separatorBuilder: (context,index)=>Padding(padding: EdgeInsets.only(right:10 )),
                            itemCount:10,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics:BouncingScrollPhysics() ,
                          ),
                        ),
                        SizedBox(height: 20,),
                         ItemsGrid(medprice: '1200',
                        medname: 'Profine',),




                      ],
                    )
                ),
              ),
          );
        }

    );
  }

   Widget BuildCatigories(context)
   {
     return InkWell(
       onTap: (){
         NavigateTo(
           context: context,
           widget: CatigoriesScreen()
         );
       }
       ,
       child: Column(
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
       ),
     );
   }


}
