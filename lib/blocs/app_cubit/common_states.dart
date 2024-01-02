abstract class CommonStates{}
class CommonInitialState extends CommonStates{}
class ChangeLanguagesState extends CommonStates{}
class ChangeLanguageTextState extends CommonStates{
String lang;
  ChangeLanguageTextState(this.lang);
}

class GetProfileSuccessesState extends CommonStates {}
class GetProfileErrorState extends CommonStates {}
class LogoutSuccsesState extends CommonStates{}