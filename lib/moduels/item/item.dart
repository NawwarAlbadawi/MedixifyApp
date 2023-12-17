
import 'package:flutter/material.dart';
import 'package:medixify/shared/components/MatrialButton.dart';
import 'package:medixify/shared/style/colors.dart';

class ItemScreen extends StatelessWidget {
   ItemScreen({super.key});
int c=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 750,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: basicColor
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage('assets/images/login.jpeg')),
                  SizedBox(height: 30,),
                  Text('Commercial name :Profine',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 15,),
                  Text('Scientific name :Profine',
                    style: TextStyle(
                        fontSize: 25,
                      fontWeight: FontWeight.w600
                    ),),
                  SizedBox(height: 15,),
                  Text('Catigory : aa',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),),
                  SizedBox(height: 15,),
                  Text('Company name : sos',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),),
                  SizedBox(height: 15,),
                  Text('Available quantity : 20',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),),
                  SizedBox(height: 15,),
                  Text('Expiration date : 1/2/2024' ,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),),
                  SizedBox(height: 15,),
                  Text('Price : 2500 ' ,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),),
                  SizedBox(height: 80,),
                  Row(
                    children: [
                      Spacer(),
                      FloatingActionButton(onPressed: (){},
                      child: Icon(Icons.remove),
                      heroTag: 'remove',),
                      Spacer(),
                      Text('$c'),
                      Spacer(),
                      FloatingActionButton(onPressed: (){},
                        child: Icon(Icons.add),
                      heroTag: 'add',),
                      Spacer()

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
