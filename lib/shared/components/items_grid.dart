


import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:medixify/shared/components/navigator.dart';


import '../../moduels/item/item.dart';
import '../style/colors.dart';

class ItemsGrid extends StatelessWidget {

   ItemsGrid({super.key, this.imagepath,this.medname,this.medprice})
   {
    image=setImage(imagepath);
   }

  String ? imagepath;
  String ? medname;
  String ? medprice;
  ImageProvider ? image;

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: ()
    {
      NavigateTo(context: context,
      widget: ItemScreen());
      },
      child: Container(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(10, (index) =>Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: basicColor,

                border: Border.all(
                    color:basicColor
                )
            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                      child: Image(image: image!)),


                  SizedBox(height: 15,),
                  Text(medname!,
                    style: TextStyle(
                        fontSize: 30,
                        color: SilverChalice
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text('Price :',
                        style: TextStyle(
                          fontSize: 15,
                          color: SilverChalice.withOpacity(0.4),

                        ),),
                      Text(medprice!,
                        style: TextStyle(
                            color: SilverChalice
                        ),),
                      Spacer(),
                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,
                        color: Colors.white,

                      ),
                      )
                    ],
                  )

                ],
              ),
            ),
          ) ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio:1.2/1.88 ,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
  ImageProvider setImage(String ? path)
  {
    if(path==null)
      {
        return  AssetImage('assets/images/notfound.jpg');
      }
    return AssetImage('assets/images/Download_Isometric_Pharmacy_and_Medication_Production_Concept_for_free-removebg.png');
  }
}

