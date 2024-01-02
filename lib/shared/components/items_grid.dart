


import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/models/home_products_model/home_products_model.dart';

import 'package:medixify/shared/components/navigator.dart';
import 'package:medixify/shared/constans/constans.dart';


import '../../blocs/app_cubit/common_cubit.dart';
import '../../generated/l10n.dart';
import '../../moduels/item/item.dart';
import '../style/colors.dart';

class ItemsGrid extends StatefulWidget {

   ItemsGrid({super.key,this.model});



     dynamic model;


  @override
  State<ItemsGrid> createState() => _ItemsGridState();
  
}

class _ItemsGridState extends State<ItemsGrid> {
  

  @override
  Widget build(BuildContext context) {


    return ConditionalBuilder(
        condition:widget.model!.data!.length!=0,
        builder: (context)=>Container(
          child: GridView.count(
            controller: ScrollController(),
            crossAxisCount: 2,
            children: List.generate(
                widget.model!.data!.length, (index) {
              return   InkWell(
                onTap: ()
                {
                  NavigateTo(context: context,
                      widget: ItemScreen(model:widget.model!.data![index]));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: basicColor,
                    // border: Border.all(
                    //   color: SilverChalice,
                    //   width: 4
                    // )


                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,


                      children: [

                        Container(
                          height: 150,
                          width: double.infinity,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(image: setImage(widget!.model!.data![index]!.image),
                                fit: BoxFit.fill,)),
                        ),


                        SizedBox(height: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${S.of(context).name}',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white.withOpacity(0.4),
                                fontWeight: FontWeight.w600

                              ),),
                            Text('${CommonCubit.get(context).isarabic? widget.model!.data![index].arMarketingName:widget.model!.data![index].enMarketingName!}',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: SilverChalice,
                                fontWeight: FontWeight.bold
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${S.of(context).Price} ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.4),
                                      fontWeight: FontWeight.w600

                                  ),),
                                Text('${widget.model!.data![index].price!} ${S.of(context).SP}',
                                  style: TextStyle(
                                      color: SilverChalice,
                                    fontWeight: FontWeight.bold
                                  ),),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: (){



                              MedixifyCubit.get(context).postFavorites(

                                  widget.model!.data![index].id!

                              );
                            },
                              icon: Icon(
                                Icons.favorite_rounded,
                              color: MedixifyCubit.get(context).favorites[widget.model!.data![index].id-1]!?Colors.red:Colors.white,
                             size: 25,

                            ),
                              color:SilverChalice,
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              );


            }
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio:1/1.71,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,


          ),
        ),
        fallback:(context)=> SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(50),


          child: Column(



            children: [
              SizedBox(height:100 ,),

              Image(
                image: AssetImage('assets/images/No data.png'),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ));

  }

  ImageProvider setImage(String ? path)
  {

    if(path==null)
      {
        return  AssetImage('assets/images/notfound.jpg');
      }
    return NetworkImage('http://${ip}:8001$path');
  }
}

