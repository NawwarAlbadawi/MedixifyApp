


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/shared/components/cart_list.dart';
import 'package:medixify/shared/components/custom_toast.dart';
import 'package:medixify/shared/style/colors.dart';

import '../../generated/l10n.dart';
import '../../shared/components/MatrialButton.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    MedixifyCubit.get(context).GetCart();
    return BlocConsumer<MedixifyCubit,MedixifyStates>(
      listener: (context,state){
        if(state is OrderTheCartSuccessesState)
          {
            if(MedixifyCubit.get(context).remainingInCart!.status==0)
        {
        CustomToast(
        context: context,
        message: S.of(context).remainingProducts,
        color: basicColor
        );}
          }

      },
        builder:(context,state){

     return   Scaffold(
       appBar: AppBar(
         title: Text(
           '${S.of(context).My_Cart}',
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
       body: ConditionalBuilder(
             condition:MedixifyCubit.get(context).cartModel.data!.length!=0 ,
             builder:(context)=> SingleChildScrollView(
          child: CartList(model: MedixifyCubit.get(context).cartModel,)),
             fallback:(context)=>
                SingleChildScrollView(
                 physics: AlwaysScrollableScrollPhysics(),
                 padding: EdgeInsets.all(50),


                 child: Column(



                   children: [
                     SizedBox(height:100 ,),

                     Image(
                       image: AssetImage('assets/images/Add to Cart.png'),
                       fit: BoxFit.cover,
                     ),
                   ],
                 ),
               ),
             ),
       bottomNavigationBar: MedixifyCubit.get(context).cartModel.data!.length!=0?Container(
         height: 150,

         decoration: BoxDecoration(

             borderRadius: BorderRadius.circular(20),
             color: SilverChalice

         ),
         child: Padding(
           padding: const EdgeInsets.only(
               top: 20
           ),
           child: Container(
             height: 100,

             decoration: BoxDecoration(

                 borderRadius: BorderRadius.circular(20),
                 color: Colors.white
             ),
             child: Padding(
               padding: const EdgeInsets.symmetric(
                   horizontal: 20,
                   vertical: 10
               ),
               child: Column(
                 children: [

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                       Text('${S.of(context).Total}',
                         style: TextStyle(
                             fontSize: 30,
                             color: basicColor
                         ),),
                       Spacer(),
                       Text('${MedixifyCubit.get(context).cartModel.total} ',
                         style: TextStyle(
                           fontSize: 30,
                           color: basicColor,

                         ),
                         maxLines: 1,
                       ),
                       Text('${S.of(context).SP}',
                         style: TextStyle(
                             fontSize: 15,
                             color: SilverChalice,
                           fontWeight: FontWeight.bold
                         ),)

                     ],
                   ),
                   Spacer(),
                   Container(
                     width: double.infinity,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: basicColor
                     ),
                     child: BuildMatrialBotton(
                       onPressed: (){
                         MedixifyCubit.get(context).OrderTheCart();
                         MedixifyCubit.get(context).GetCart();

                         }
                     ,
                       text: S.of(context).OrderNow,
                       color: SilverChalice,
                     ),
                   )
                 ],
               ),
             ),
           ),
         ),
       ):null,
     );
    });

  }
}
