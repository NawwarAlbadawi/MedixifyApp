

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/models/profile_model/profile_model.dart';
import 'package:medixify/moduels/favorite/favorite.dart';
import 'package:medixify/moduels/home/home.dart';
import 'package:medixify/moduels/profile/profile.dart';

import '../../../moduels/orders/orders.dart';
import '../../../shared/constans/constans.dart';
import '../../../shared/network/remote/dio_helper.dart';



class MedixifyCubit extends Cubit <MedixifyStates>
{
  MedixifyCubit():super(MedixifyInitialStates());
  static MedixifyCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  List<Widget>screens=[
    HomeScreen(),
    FavoritesScreen(),
    OrdersScreen(),
    ProfileScreen()
  ];
  void changeGNavBar(int index)
  {
    currentIndex=index;
    emit(ChangeGNavBarStates());
  }
  int countity=0;
  void addcountity()
  {
    countity++;
    emit(addState());

  }
  void removecountity()
  {
    if(countity>0)
      {
        countity--;
        emit(removeState());
      }


  }
ProfileModel ?profileModel;
  void getData()
  {
    DioHelper.getData('profile',
        token).then((value) {
      profileModel=ProfileModel.fromjson(value.data);
      print(profileModel!.data!.email);

      emit(GetProfileSuccessesState());
    }).catchError((error){
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }




}