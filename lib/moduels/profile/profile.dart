
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/blocs/app_cubit/common_cubit.dart';
import 'package:medixify/blocs/app_cubit/common_states.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/moduels/profile/profiledetails.dart';
import 'package:medixify/shared/components/navigator.dart';
import 'package:medixify/shared/network/local/shared_preferebces.dart';
import 'package:medixify/shared/style/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommonCubit,CommonStates>(
        listener:(context,state){},
        builder: (context,state){
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: basicColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: basicColor
                    )
                  ),
                  child: InkWell(
                    onTap: (){
                      NavigateTo(
                        context: context,
                        widget: ProfileDetails()
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 4,),
                        CircleAvatar(
                          radius: 30,
                       backgroundImage: AssetImage('assets/images/avatar.jpg'),

                        ),
                        SizedBox(width: 100,),

                        Expanded(
                          child: Text('${MedixifyCubit.get(context).profileModel!.data!.name!}',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.white
                          ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        IconButton(onPressed: (){NavigateTo(
                            context: context,
                            widget: ProfileDetails()
                        );},
                            icon:Icon(
                              Icons.arrow_forward_ios,

                            ),

                          color: Colors.white,
                          splashColor:SilverChalice,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:  basicColor
                  ),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                        CommonCubit.get(context).changeLanguage();

                      },
                          icon: Icon(Icons.language,
                          color: Colors.white,)),
                      SizedBox(width: 20,),


                      Text(
                        CommonCubit.get(context).lang,
                        style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white
                      ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );

        },);
  }
}
