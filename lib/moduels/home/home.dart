


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medixify/blocs/app_cubit/common_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/models/categories_model/CategoriesModel.dart';
import 'package:medixify/moduels/cart/cart.dart';
import 'package:medixify/moduels/catigories/catigories.dart';
import 'package:medixify/moduels/search/search_screen.dart';
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

    return RefreshIndicator(
      color: basicColor,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,


      onRefresh: () {
        return refresh(context);
      },

      child: BlocConsumer<MedixifyCubit,MedixifyStates>(
          listener: (context,states){

          },
          builder: (context,states){
            var cubit=MedixifyCubit.get(context);

            return ConditionalBuilder(
                condition:cubit.productsModel!=null&&cubit.categoriesModel!=null&&cubit.searchModel!=null ,
                builder: (context)=>SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: InkWell(
                                 radius: 30,
                                  onTap: (){
                                    NavigateTo(
                                      context: context,
                                      widget: SearchScreen()
                                    );
                                  },
                                  child: Container(

                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                     // color: basicColor,
                                      border: Border.all(
                                        color: basicColor,
                                        width: 3
                                      )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.search_rounded
                                          ),
                                        ),

                                        Text('${S.of(context).search_med}'),
                                        Spacer()
                                      ],
                                    ),




                                  ),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    NavigateTo(
                                      context: context,
                                      widget: CartScreen()
                                    );
                                  },
                                  child: Container(
                                    height:50,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: SilverChalice
                                    ),
                                    child: Center(
                                      child: IconButton(onPressed: (){
                                        NavigateTo(context: context,
                                        widget: CartScreen());
                                      },
                                          icon: Icon(Icons.shopping_bag,
                                            size: 30,
                                            color: basicColor,
                                          )),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height:110 ,
                            child: BuildCatigories(context, MedixifyCubit.get(context).categoriesModel!),
                          ),
                          SizedBox(height: 20,),
                          ItemsGrid(model: cubit.productsModel,),




                        ],
                      )
                  ),
                ),
                fallback:(context)=>Center(
                  child: CircularProgressIndicator(),
                )  );

          }

      ),
    );
  }

   Widget BuildCatigories(context,
       CategoriesModel model)
   {
     return ListView.separated(
     itemBuilder:(context,index)=>
         InkWell(
       onTap: (){
         MedixifyCubit.get(context).Search(category: model.data![index].categoryName);
         NavigateTo(
             context: context,
             widget: CatigoriesScreen(name:CommonCubit.get(context).isarabic?model.data![index].arabicCategoryName:model.data![index].categoryName ,)
         );
       }
       ,
       child: Container(

         width: 70,
         child: Column(
           children: [
             CircleAvatar(
               backgroundColor: basicColor,
               radius: 30,
               child: CircleAvatar(
                 radius: 25,
                 backgroundColor: SilverChalice,
                 child: Icon(
                   Icons.local_pharmacy_rounded
                 )
                 // child:Text('${CommonCubit.get(context).isarabic?model.data![index].arabicCategoryName:model.data![index].categoryName}',
                 //   style: TextStyle(
                 //       fontSize: 10,
                 //       color: Colors.white,
                 //     fontWeight: FontWeight.bold
                 //       ),
                 //   textAlign: TextAlign.center,
                 //
                 // ) ,
               ),

             ),
             SizedBox(height: 10,),
             Expanded(
               child: Text('${CommonCubit.get(context).isarabic?model.data![index].arabicCategoryName:model.data![index].categoryName}',
                 style: TextStyle(
                     fontSize: 12,
                   fontWeight: FontWeight.bold,
               
                 ),
                 maxLines: 2,
                 textAlign: TextAlign.center,
                 overflow: TextOverflow.ellipsis,
               ),
             )
           ],
         ),
       ),
     ) ,
     separatorBuilder: (context,index)=>Padding(padding: EdgeInsets.only(right:10 )),
     itemCount:model.data!.length,
     scrollDirection: Axis.horizontal,
     shrinkWrap: true,
     physics:BouncingScrollPhysics() ,
   );



   }

   Future<void>  refresh(context)
   async {
    MedixifyCubit.get(context).getProducts();
    MedixifyCubit.get(context).getCategories();

     return Future.delayed(
         Duration(
             milliseconds: 200)
     );
   }


}
