

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:ionicons/ionicons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/shared/style/colors.dart';

import '../../generated/l10n.dart';
class MedixifyApp extends StatelessWidget {
   MedixifyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedixifyCubit,MedixifyStates>(
      listener: (context,states){},
      builder: (context,states){
        var local=S.of(context);
        MedixifyCubit cubit=MedixifyCubit.get(context);
        return SafeArea(


          child: Scaffold(








            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(
                  bottom: 2,
                  left: 10,
                  right: 10,
                  top: 2
              ),
              child: GNav(


                selectedIndex:MedixifyCubit.get(context).currentIndex ,
                onTabChange: (index){
                  MedixifyCubit.get(context).changeGNavBar(index);

                },
                haptic: true, // haptic feedback
                tabBorderRadius: 40,
                tabActiveBorder: Border.all(color: basicColor, width: 1), // tab button border
                // tabShadow: [BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 8)], // tab button shadow
                curve: Curves.easeOutExpo, // tab animation curves
                duration: Duration(milliseconds: 90), // tab animation duration
                gap: 2, // the tab button gap between icon and text
                color:basicColor,
                activeColor:SilverChalice,



                // unselected icon color

                // selected icon and text color
                iconSize: 25, // tab button icon size
                tabBackgroundColor: basicColor,





                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10,
                ),
                style: GnavStyle.google,






                tabs: [
                  GButton(icon: Icons.home,text:local.home ,),
                  GButton(icon: Icons.favorite,text:local.favorite ,),
                  GButton(icon:Icons.shopping_cart,text:local.orders ,),
                  GButton(icon: Icons.person,text: local.profile,),

                ],

              ),
            ),


            body:cubit.screens[cubit.currentIndex] ,
          ),
        );
      },

    );
  }
}
