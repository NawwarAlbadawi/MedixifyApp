

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medixify/layout/medixify/cubit/app_states.dart';
import 'package:medixify/models/cart_model/cart_model.dart';
import 'package:medixify/models/categories_model/CategoriesModel.dart';
import 'package:medixify/models/favorites_model/favorites_model.dart';
import 'package:medixify/models/home_products_model/home_products_model.dart';
import 'package:medixify/models/order_model/OrderModel.dart';
import 'package:medixify/models/profile_model/profile_model.dart';
import 'package:medixify/moduels/favorite/favorite.dart';
import 'package:medixify/moduels/home/home.dart';
import 'package:medixify/moduels/profile/profile.dart';
import 'package:medixify/shared/network/local/shared_preferebces.dart';

import '../../../models/search_model/search_model.dart';
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
  int qoantity=0;
  void addcountity()
  {
    qoantity++;
    emit(addState());

  }
  void removecountity()
  {
    if(qoantity>0)
      {
        qoantity--;
        emit(removeState());
      }


  }
ProfileModel ?profileModel;
  void getProfileData()
  {

    DioHelper.getData(
        path:'profile',
       token: token).then((value) {

      profileModel=ProfileModel.fromjson(value.data);
      print(profileModel!.data!.ar_city);

      emit(GetProfileSuccessesState());
    }).catchError((error){
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }
  void updateProfileData(
  {
    String ?name,String ?password,
    String ?email,
    int ?city,
    String ?pharmacyName,
    String?pharmacyAddress,
    String?phone,

}
      )
  {
    print(CachHelper.getSharedPreferences('token'));

    DioHelper.postData(
        path:'update_profile',
        data: {
          "Full_name" : name,
          "Email_address":email,
          "Phone_number" : phone,
          "Password" :password,
          "Pharmacy_name" :pharmacyName,
          "City" : city,
          "Pharmacy_address" : pharmacyAddress
        },
        token: token).then((value) {
      getProfileData();
      emit(UpdateProfileSuccessesState());

    }).catchError((error){

      emit(UpdateProfileErrorState());
    });
  }


 late List<bool>favorites=[];
ProductsModel?productsModel;
bool load=false;
  void getProducts()
  {


    emit(LoadingHomeProductsSuccessesState());
    DioHelper.getData(path: 'getAllProducts/${CachHelper.getSharedPreferences('userId')}',
       token:token ).then((value) {
         productsModel=ProductsModel.fromJson( value.data);
         productsModel!.data!.forEach((element) {
           favorites.add(element.favorite!);
         });
          emit(GetHomeProductsSuccessesState());
          getFavorites();
    } ).catchError((error){
      print(error.toString());
      emit(GetHomeProductsErrorState());
    });
  }

  FavoritesModel?favoritesModel;
  void getFavorites()
  {

    DioHelper.getData(path: 'getAllFavorates',
        data: {
          "phamacist_id":CachHelper.getSharedPreferences('userId')
        },

        token: token).then((value) {
      favoritesModel=FavoritesModel.fromJson( value.data);
      emit(GetFavoritesProductsSuccessesState());
    } ).catchError((error){
      print(error.toString());
      emit(GetFavoritesProductsErrorState());
    });
  }

  void postFavorites(int id)
  {
    emit(changeFavoritesIconState());
    DioHelper.postData(
      path: 'putInfavorates',
        data: {
          "phamacist_id" :CachHelper.getSharedPreferences('userId'),
          "products_id" : id
        },
        ).then((value) {
       favorites[id-1]=!favorites[id-1];
      getFavorites();
      getProducts();
      GetCart();

      emit(GetFavoritesProductsSuccessesState());
    } ).catchError((error){

      emit(GetFavoritesProductsErrorState());
    });
  }
CategoriesModel?categoriesModel;
  void getCategories()
  {
    DioHelper.getData(path:'getAllCategorys',
        token: token).then((value) {
      categoriesModel=CategoriesModel.fromJson( value.data);
      load=true;
      emit(GetCategoriesSuccessesState());
    } ).catchError((error){
      print(error.toString());
      emit(GetCategoriesErrorState());
    });
  }
  SearchModel?searchModel;
  void Search
      (
      {
    String ? category,
    String ?name})
  {
    emit(LoadingSearchState());

    DioHelper.getData(path: 'search_product',
        query:{
      "category":category,
       "name":name,
          "phamacist_id":CachHelper.getSharedPreferences('userId')

        } ,
        token: token).then((value) {
          print(value.data);
          searchModel=SearchModel.fromJson(value.data);
      emit(GetSearchSuccessesState());
    } ).catchError((error){
      print(error.toString());
      emit(GetSearchErrorState());
    });
  }

  void PutIntoCart({
    required int quantity,
    required int productId
})
  {
    DioHelper.postData(path: 'putInProduct_basket',
      data: {
        'phamacist_id':CachHelper.getSharedPreferences('userId'),
        'product_id':productId,
        'Quantity':quantity
      }
    ).then((value) {
      emit(PutIntoCartSuccessesState());
      GetCart();


    }).catchError((error){
      emit(PutIntoCartErrorState());
    });
  }

late  CartModel cartModel;
int total=0;

  void GetCart ()
  {
    DioHelper.getData(path:'getAllProductsInbasket/${CachHelper.getSharedPreferences('userId')}' ).
    then((value) {

      cartModel=CartModel.fromJson(value.data);

      emit(GetCartSuccessesState());
    }).catchError((error){
      print(error.toString());
      emit(GetCartErrorState());
    });

  }
  
  void removeFromCart(int productId)
  {
    DioHelper.deleteData(path: 'deleteProduct_basket/${productId}',
      data: {
      'phamacist_id':CachHelper.getSharedPreferences('userId')
      }
    ).then((value) {
      GetCart();
    });
  }
  void OrderTheCart()
  {
    DioHelper.postData(path:'create_order_from_basket/1/${CachHelper.getSharedPreferences('userId')}' ).
    then((value) {
      emit(OrderTheCartSuccessesState());
      GetCart();
    }).catchError((error){
      emit(OrderTheCartErrorState());
    });
  }
OrderModel? orderModel;
  void GetOrder()
  {

    DioHelper.getData(path:'getAllOrders/${CachHelper.getSharedPreferences('userId')}' ).
    then((value) {
      orderModel=OrderModel.fromJson(value.data);
      emit(GetOrderSuccessesState());
    }).catchError((error){
      print('${error.toString()}');
      emit(GetOrderErrorState());
    });
  }



}