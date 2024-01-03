import 'package:medixify/models/update_profile_error_model/update_profile_error_model.dart';

abstract class MedixifyStates {}
class MedixifyInitialStates extends MedixifyStates{}
class ChangeGNavBarStates extends MedixifyStates{}
class addState extends MedixifyStates {}
class removeState extends MedixifyStates {}
class GetProfileSuccessesState extends MedixifyStates {}
class GetProfileErrorState extends MedixifyStates {}

class UpdateProfileSuccessesState extends MedixifyStates {}
class UpdateProfileErrorState extends MedixifyStates {
 UpdateProfileError?error;
  UpdateProfileErrorState(
       this.error
      );
}


class LoadingHomeProductsSuccessesState extends MedixifyStates{}
class GetHomeProductsSuccessesState extends MedixifyStates {}
class GetHomeProductsErrorState extends MedixifyStates {}

class GetFavoritesProductsSuccessesState extends MedixifyStates {}
class GetFavoritesProductsErrorState extends MedixifyStates {}
class changeFavoritesIconState extends MedixifyStates{}

class DeleteFavoritesProductsSuccessesState extends MedixifyStates {}
class DeleteFavoritesProductsErrorState extends MedixifyStates {}

class GetCategoriesSuccessesState extends MedixifyStates {}
class GetCategoriesErrorState extends MedixifyStates {}

class LoadingSearchState extends MedixifyStates{}
class GetSearchSuccessesState extends MedixifyStates {}
class GetSearchErrorState extends MedixifyStates {}

class PutIntoCartSuccessesState extends MedixifyStates{}
class PutIntoCartErrorState extends MedixifyStates{}
class RemoveFromCart extends MedixifyStates{}

class GetCartSuccessesState extends MedixifyStates{}

class GetCartErrorState extends MedixifyStates{}

class OrderTheCartSuccessesState extends MedixifyStates{}
class OrderTheCartErrorState extends MedixifyStates{}

class GetOrderSuccessesState extends MedixifyStates{}
class GetOrderErrorState extends MedixifyStates{}

class GetCityState extends MedixifyStates{}
class LoadingCity extends MedixifyStates{}