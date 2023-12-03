import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/blocs/app_cubit/common_states.dart';

class CommonCubit extends Cubit<CommonStates>
{
  CommonCubit():super(CommonInitialState());
  static CommonCubit get(context)=>BlocProvider.of(context);
  bool isarabic=false;
  void changeLanguage()
  {
    isarabic=!isarabic;
    emit(ChangeLanguagesState());

  }

}