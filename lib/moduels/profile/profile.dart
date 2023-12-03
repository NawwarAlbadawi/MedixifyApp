
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/blocs/app_cubit/common_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_cubit.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedixifyCubit,MedixifyStates>(
        listener:(context,state){},
        builder: (context,state){
          return Column(
            children: [
              IconButton(onPressed: (){
                CommonCubit.get(context).changeLanguage();

              },
                  icon: Icon(Icons.language))
            ],
          );

        },);
  }
}
