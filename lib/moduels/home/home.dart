
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/shared/components/MatrialButton.dart';
import 'package:medixify/shared/components/form_field.dart';
import 'package:medixify/shared/style/colors.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   var searchController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedixifyCubit,MedixifyStates>(
        listener: (context,states){},
        builder: (context,states){
          return BlocConsumer<MedixifyCubit,MedixifyStates>(
              listener: (context,states){},
              builder: (context,states){
                return SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Container(
                              width:double.infinity,
                              child: BuildFormField(controller:searchController ,
                                inputType: TextInputType.text,
                                validator: (value){
                                  return null;
                                },
                                label: 'Search Med',
                                prefix: Icons.search,),
                            ),
                            SizedBox(height: 20,),


                            Container(
                              height: 90 ,
                              child: ListView.separated(itemBuilder:(context,index)=> BuildCatigories(),
                                separatorBuilder: (context,index)=>Padding(padding: EdgeInsets.only(right:10 )),
                                itemCount:10,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                              ),
                            ),
                            SizedBox(height: 20,),

                            // ListView.separated(itemBuilder:(context,index)=>BuildCatigories(context) ,
                            // separatorBuilder:(context,index)=>Container(height: 5,
                            // decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            // color: Colors.white,
                            // ),
                            //
                            // ) , itemCount: 10,
                            //
                            // physics: NeverScrollableScrollPhysics(),
                            //   shrinkWrap: true,
                            //
                            //
                            // ),
                            Container(



                              child: GridView.count(crossAxisCount: 2,
                                children: List.generate(10, (index) => BuildGrid()),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio:1/1.6 ,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,



                              ),
                            )


                          ],
                        )
                    ),
                  ) ;
              }
          );
        }

    );
  }
   Widget BuildGrid()
   {
     return Container(
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(30),
           color:YankeesBlue,
           border: Border.all(
               color:SilverChalice
           )
       ),

       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,

           children: [
             // Image(image: AssetImage(
             //     'assets/images/Download_Isometric_Pharmacy_and_Medication_Production_Concept_for_free-removebg.png'),

             //),
             SizedBox(height: 15,),
             Text('Profine',
               style: TextStyle(
                 fontSize: 30,
                   color: SilverChalice

               ),),
             Spacer(),
             Row(
               children: [
                 Text('Price :',
                   style: TextStyle(
                     fontSize: 15,
                     color: SilverChalice.withOpacity(0.4),

                   ),),
                 Text('12000',
                 style: TextStyle(
                     color: SilverChalice
                 ),),
                 Spacer(),
                 IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,

                 ),
                 )
               ],
             )

           ],
         ),
       ),
     );

   }
   Widget BuildCatigories()
   {
     return Column(
       children: [
         CircleAvatar(
           backgroundColor: YankeesBlue,
           radius: 30,
         ),
         SizedBox(height: 10,),
         Text('UntiBioteq',
         style: TextStyle(
           fontSize: 10
         ),)
       ],
     );
   }

}
