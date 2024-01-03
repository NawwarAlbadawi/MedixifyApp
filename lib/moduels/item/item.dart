
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:medixify/blocs/app_cubit/common_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/models/home_products_model/home_products_model.dart';
import 'package:medixify/shared/components/MatrialButton.dart';
import 'package:medixify/shared/components/custom_toast.dart';
import 'package:medixify/shared/style/colors.dart';

import '../../generated/l10n.dart';
import '../../shared/constans/constans.dart';

class ItemScreen extends StatelessWidget {
   ItemScreen({super.key,this.model});
int quantity=0;
dynamic model;

  @override
  Widget build(BuildContext context) {
    var local=S.of(context);
    return BlocConsumer<MedixifyCubit,MedixifyStates>(
      listener: (context,state){
        if(state is PutIntoCartSuccessesState)
          {
            CustomToast(
            message: S.of(context).Addedtocart,
              context: context,
              color: SilverChalice,

            );
          }
      },
      builder: (context,state)
      {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: (){
                Navigator.of(context).pop();
              },
                  icon: Icon(Icons.arrow_back_ios)) ,

            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),

                              child: Container(
                                width: double.infinity,
                                child: Image(
                                  fit: BoxFit.contain,

                                  image: NetworkImage('http://${ip}:8001${model!.image}'),
                                ),
                              )),
                        ),

                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Text('${CommonCubit.get(context).isarabic?model!.arMarketingName:model!.enMarketingName}',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: basicColor
                          ),


                        ),
                        Spacer(),
                        IconButton(
                            onPressed: (){
                              MedixifyCubit.get(context).postFavorites(model!.id!);
                            }, icon: Icon(
                          Icons.favorite_rounded,
                          color: MedixifyCubit.get(context).favorites[model!.id!]!?Colors.red:Colors.grey,size: 25,)
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color:SilverChalice,
                      ),
                      height: 3,

                      width: 100,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Expanded(
                          child: Column(



                            children: [
                              SizedBox(height: 25,),
                              Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text('${local.Scientific_name}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey.withOpacity(0.8)
                                      ),),
                                    Text('${model!.scientificName}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: basicColor
                                      ),
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text('${local.Company}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey.withOpacity(0.8)
                                      ),),
                                    Text('${CommonCubit.get(context).isarabic?model!.arFactory:model!.enFactory}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: basicColor
                                      ),
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text('${local.Expiration_date}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey.withOpacity(0.8)
                                      ),),
                                    Text('${model!.expDate}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: basicColor
                                      ),
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,


                            children: [

                              SizedBox(height: 25,),
                              Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      '${local.Category}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey
                                      ),),
                                    Text('${CommonCubit.get(context).isarabic?model!.arCategory:model!.enCategory}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: basicColor
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),

                              Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      '${local.Available_quantity}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Text('${model!.quantity}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: basicColor
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,

                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(
                                      '${local.Price}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey
                                      ),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text('${model!.price}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: basicColor
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,

                                        ),
                                        Text(' ${local.SP}',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color:SilverChalice
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,

                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 80,),
                    Row(
                      children: [
                        Spacer(),

                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: SilverChalice
                          ),
                          child: IconButton(
                            icon: Icon(Icons.remove,
                              size: 30,

                            ),
                            color: basicColor,


                            onPressed: (){
                              if(quantity>0)
                                {
                                  quantity--;
                              MedixifyCubit.get(context).removecountity();}
                            },

                          ),
                        ),
                        Spacer(),
                        Text('${quantity}',
                          style: TextStyle(
                              fontSize: 20
                          ),),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: SilverChalice
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add,
                              size: 30,
                            ),
                            color: basicColor,
                            onPressed: (){

                              if(quantity<model!.quantity)
                                quantity++;
                                 MedixifyCubit.get(context).addcountity();
                            },

                          ),
                        ),
                        Spacer(),


                      ],
                    ),
                    SizedBox(height: 50,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: basicColor
                      ),
                      child:BuildMatrialBotton(
                        text: local.AddToCart,
                        onPressed: (){
                          if(quantity!=0)
                            {
                          MedixifyCubit.get(context).PutIntoCart(quantity:quantity ,
                              productId: model.id);
                            }
                        },
                        color: SilverChalice,

                      ),
                    )
                    ////repo


                  ],
                ),
              ),
            )
        );
      },

    );
  }
}
