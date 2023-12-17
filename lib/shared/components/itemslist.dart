
import 'package:flutter/material.dart';

import '../style/colors.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:(context,index)=>Container(
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
                child: Image(image: AssetImage('assets/images/Download_Isometric_Pharmacy_and_Medication_Production_Concept_for_free-removebg.png'))),
            Spacer(),
            Text('products')
          ],
        ),
      ),
      separatorBuilder:(context,index)=>Container(height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),

      ) , itemCount: 10,

      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,

    );
  }
}
