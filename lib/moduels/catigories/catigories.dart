
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/shared/components/form_field.dart';
import 'package:medixify/shared/style/colors.dart';

class CatigoriesScreen extends StatelessWidget {
   CatigoriesScreen({super.key});
  var searchController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<MedixifyCubit,MedixifyStates>(
      listener: (context,states){},
      builder: (context,states){
        return SingleChildScrollView(
          child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width:300,
                child: BuildFormField(controller:searchController ,
                inputType: TextInputType.text,
                validator: (value){
                return null;
                },
                label: 'Search Med',
                prefix: Icons.search,),
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,
              size: 30,
              ))
            ],
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
        );
  }
    );


}
  Widget BuildCatigories(context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: YankeesBlue,

      ),
      height: 120,

      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Image(image: AssetImage(
              'assets/images/Download_Isometric_Pharmacy_and_Medication_Production_Concept_for_free-removebg.png'),
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),


          Padding(
            padding: const EdgeInsets.only(
                left: 20,
                top: 10
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  ),),
                SizedBox(height: 5,),
                Text('Profin',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black
                  ),),
                SizedBox(height: 10,),
                Text('Price :',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.withOpacity(0.6)
                  ),),
                SizedBox(height: 5,),
                Text('${MedixifyCubit
                    .get(context)
                    .countity}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),


              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                FloatingActionButton.small(onPressed: () {
                  MedixifyCubit.get(context).addcountity();
                },
                  child: Icon(Icons.add,
                    color: Colors.black,),
                  backgroundColor: Colors.white,
                ),
                FloatingActionButton.small(onPressed: () {
                  MedixifyCubit.get(context).removecountity();
                },
                  child: Icon(Icons.remove,
                    color: Colors.black,),
                  backgroundColor: Colors.white,
                ),
              ],

            ),
          )


        ],
      ),


    );
  }
 Widget BuildGrid()
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.4)
        )
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
        Image(image: AssetImage(
        'assets/images/Download_Isometric_Pharmacy_and_Medication_Production_Concept_for_free-removebg.png'),
        ),
         SizedBox(height: 15,),
         Text('Profine',
         style: TextStyle(
           fontSize: 30,

         ),),
        Spacer(),
        Row(
          children: [
            Text('Price :',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black.withOpacity(0.4),

            ),),
            Text('12000'),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.favorite,

            ),
            )
          ],
        )

          ],
        ),
      ),
    );

  }

  }
