
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medixify/models/cart_model/cart_model.dart';
import 'package:medixify/moduels/item/item.dart';
import 'package:medixify/shared/components/MatrialButton.dart';
import 'package:medixify/shared/components/navigator.dart';
import 'package:medixify/shared/constans/constans.dart';
import 'package:medixify/shared/style/colors.dart';
import '../../blocs/app_cubit/common_cubit.dart';
import '../../generated/l10n.dart';
import '../../layout/medixify/cubit/app_cubit.dart';
class CartList extends StatelessWidget {
   CartList({super.key,this.model});
  CartModel? model;
  @override
  Widget build(BuildContext context) {

    return ConditionalBuilder(condition:model!.data!.length==0 ,
        builder: (context)=>SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              SizedBox(height:100 ,),
              Image(
                image: AssetImage('assets/images/notfound.jpg'),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        fallback: (context)=>ListView.separated(
          separatorBuilder: (context,index)=>Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          itemCount: model!.data!.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: (){
                  NavigateTo(
                    context: context,
                    widget: ItemScreen(model: model!.data![index],)

                  );
                },
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
                            image: NetworkImage('http://${ip}:8001${model!.data![index].image}'),
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
                            Text('${CommonCubit.get(context).isarabic?model!.data![index].arMarketingName:model!.data![index].enMarketingName}',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text('${CommonCubit.get(context).isarabic?model!.data![index].arCategory:model!.data![index].enCategory}',
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
                                    '${model!.data![index].quantity}',
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
                                Text('${model!.data![index].price}',
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
                      Expanded(
                        child: Column(

                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children:[
                              SizedBox(height: 30,),
                              IconButton(onPressed:(){
                                MedixifyCubit.get(context).postFavorites(

                                    model!.data![index].id!

                                );
                              } ,
                                  icon: Icon(Icons.favorite,
                                    color: model!.data![index].favorite!?Colors.red:Colors.grey,)),
                              Spacer(),
                              IconButton(onPressed:(){
                                MedixifyCubit.get(context).removeFromCart(model!.data![index].id!);
                              } ,
                                icon: Icon(Ionicons.trash,
                                  color: Colors.grey,),

                              ),

                            ]

                        ),
                      )

                    ],
                  ),
                ),
              ),
            );
          },
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),

        ));
  }
}
