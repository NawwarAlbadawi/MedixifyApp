
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/shared/components/items_grid.dart';
import 'package:medixify/shared/components/itemslist.dart';

import '../../generated/l10n.dart';
import '../../layout/medixify/cubit/app_cubit.dart';
import '../../layout/medixify/cubit/app_states.dart';
import '../../shared/components/form_field.dart';
import '../../shared/components/navigator.dart';
import '../../shared/style/colors.dart';
import '../cart/cart.dart';
import '../search/search_screen.dart';

class FavoritesScreen extends StatelessWidget {
   FavoritesScreen({super.key});
  var searchController= TextEditingController();

  @override
  build(BuildContext context) {
    var cubit=MedixifyCubit.get(context);
    //MedixifyCubit.get(context).getFavorites();
    return RefreshIndicator(
      color: basicColor,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () {
        return refresh(context);
      },

      child: BlocConsumer<MedixifyCubit,MedixifyStates>(
          listener: (context,states){},
          builder: (context,states){
            var cubit=MedixifyCubit.get(context);
           // print(cubit.favoritesModel!.data!.length);

            return ConditionalBuilder(
                condition:MedixifyCubit.get(context).favoritesModel==null,
                builder: (context)=>Center(
                  child: CircularProgressIndicator(),
                ),
                fallback:(context)=>  SingleChildScrollView(
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
                          ItemsGrid(model: cubit.favoritesModel,),




                        ],
                      )
                  ),
                ));

          }

      ),
    );
  }
   Future<void>refresh(context)
   async {
    MedixifyCubit.get(context).getFavorites();

     return Future.delayed(
         Duration(
             milliseconds: 1000
         )
     );
   }
}
