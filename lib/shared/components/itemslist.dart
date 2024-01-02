
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:medixify/models/order_model/OrderModel.dart';
import 'package:medixify/models/order_model/OrderModel.dart';
import 'package:medixify/models/order_model/OrderModel.dart';
import 'package:medixify/moduels/cart/cart.dart';
import 'package:medixify/moduels/order_details/order_details.dart';
import 'package:medixify/shared/components/navigator.dart';

import '../../generated/l10n.dart';
import '../../models/order_model/OrderModel.dart';
import '../style/colors.dart';

class ItemsList extends StatelessWidget {
   ItemsList({super.key,
  this.height=120,
  this.raduis=20,
     required this.model
   });
  int ?height;
  int ?raduis;
 OrderModel ?model;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: model!.data!.length!=0,
      builder:(context)=> ListView.separated(
        itemBuilder:(context,index)=>InkWell(
          onTap: (){
            NavigateTo(context: context,
            widget: OrderDetails(model: model!.data![index]),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: basicColor
                ),
              borderRadius: BorderRadius.circular(20)
            ),
            height: 120,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                    child: Image(image: AssetImage('assets/images/notfound.jpg'))),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${
                       S.of(context).orderStatus( model!.data![index].status!)
                        }',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: basicColor,
                        fontSize: 20
                      ),),

                      Text('${S.of(context).orderPaymentStatus( (model!.data![index].paymentStatus!)-1)}',
                      style: TextStyle(
                        fontSize: 15,
                        color: SilverChalice,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        separatorBuilder:(context,index)=>Padding(padding: EdgeInsets.all(10)) , itemCount: model!.data!.length,

        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,

      ),
      fallback: (context)=>SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(50),


        child: Column(



          children: [
            SizedBox(height:100 ,),

            Image(
              image: AssetImage('assets/images/Order.png'),
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
