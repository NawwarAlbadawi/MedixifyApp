

 import 'package:flutter/material.dart';
import 'package:medixify/models/order_model/OrderModel.dart';
import 'package:medixify/shared/style/colors.dart';

import '../../blocs/app_cubit/common_cubit.dart';
import '../../generated/l10n.dart';
import '../../layout/medixify/cubit/app_cubit.dart';
import '../../shared/components/MatrialButton.dart';
import '../../shared/constans/constans.dart';

class OrderDetails extends StatelessWidget {
   OrderDetails({super.key,
   required this.model});
  Data model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Order',
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
      body: SingleChildScrollView(
          child:ListView.separated(
            separatorBuilder: (context,index)=>Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            itemCount: model.products!.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: basicColor,
                                strokeAlign: BorderSide.strokeAlignInside,
                                width: 2

                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: ClipRRect(
                          child:Image(
                            image: NetworkImage('http://${ip}:8001${model.products![index].image}'),
                            fit: BoxFit.cover,
                          ) ,
                          borderRadius: BorderRadius.circular(30),

                        ),
                      ),
                      SizedBox(width: 30,),
                      Expanded(
                        flex: 5,
                        child: Column(
                          textBaseline:TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,


                          children: [
                            SizedBox(height: 30,),
                            Text('${CommonCubit.get(context).isarabic?model.products![index].arabicName:model.products![index].marketingName}',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text('${CommonCubit.get(context).isarabic?model.products![index].arabicCategoryName:model.products![index].categoryName}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: basicColor
                              ),
                            ),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Expanded(
                                  flex:2,
                                  child: Text("${S.of(context).Amount}  ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: SilverChalice
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${model.products![index].quantity}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: basicColor

                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text('${model.products![index].priceAllproducts}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: basicColor
                                  ),
                                ),
                                Text(' ${S.of(context).SP}',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: SilverChalice
                                  ),
                                ),
                              ],
                            ),




                          ],
                        ),
                      ),
                      Spacer(),


                    ],
                  ),
                ),
              );
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

          ) ),
      bottomNavigationBar: Container(
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
                      Text('Total',
                        style: TextStyle(
                            fontSize: 30,
                            color: basicColor
                        ),),
                      Spacer(),
                      Text('${model.priceAllproducts}',
                        style: TextStyle(
                          fontSize: 30,
                          color: basicColor,

                        ),
                        maxLines: 1,
                      ),
                      Text('${S.of(context).SP}',
                        style: TextStyle(
                            fontSize: 15,
                            color: SilverChalice
                        ),)

                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
