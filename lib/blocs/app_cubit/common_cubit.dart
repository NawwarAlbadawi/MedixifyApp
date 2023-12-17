import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/blocs/app_cubit/common_states.dart';
import 'package:medixify/shared/network/local/shared_preferebces.dart';

import '../../shared/constans/constans.dart';
import '../../shared/network/remote/dio_helper.dart';

class CommonCubit extends Cubit<CommonStates>
{
  CommonCubit():super(CommonInitialState());
  static CommonCubit get(context)=>BlocProvider.of(context);
  bool isarabic=false;
  String lang =CachHelper.getSharedPreferences('arabic')!=null?
  CachHelper.getSharedPreferences('arabic').toString():'English';
  void changeLanguage()
  {
    isarabic=!isarabic;

    if(isarabic)
      {
        lang='العربية';
        emit(ChangeLanguageTextState(
          lang

        ));
        CachHelper.setSharedPreferences(value: 'العربية', key:'arabic').then((value) {


          emit(ChangeLanguagesState());

        } ).catchError((error){
          print(error.toString());
        });
      }
    else
      {
        lang='English';
        emit(ChangeLanguageTextState(
          lang

        ));
        CachHelper.setSharedPreferences(value: 'English', key:'arabic').then((value) {

          emit(ChangeLanguagesState());

        }).catchError((error){
          print(error.toString());
        });
      }



  }

  void getData()
  {
    DioHelper.getData('profile',token).then((value) {
      //print(token);
      print(value.data);
      emit(GetProfileSuccessesState());
    }).catchError((error){
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }



}
