import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_2022/Network/remote/dio_helper.dart';
import 'package:grad_2022/inside/models/DiningResponse.dart';
import 'package:grad_2022/inside/modules/dining/cafe_screen/cubit/diningstates.dart';
import 'package:grad_2022/shared/variables.dart';

class Diningcubit extends Cubit<DiningStates> {
  Diningcubit() : super(DiningIntialStates());

  static Diningcubit get(context) => BlocProvider.of(context);

  DiningIdResponse? diningIdResponse;

  void diningId(int din_id) {
    dininglist.clear();
    emit(DiningLoadingStates());
    DioHelper.FindByIdCategory(
      url: '/Dining/FindByDiningId',
      query:{
        "Id":din_id,
      } ,
    ).then((value)
    {
      for(int i=0;i<value!.data.length;i++){
        diningIdResponse =DiningIdResponse.fromJson(value.data[i]);
        dininglist.add(diningIdResponse!);}

      emit(DiningSuccesssStates());
    }).catchError((error) {
      print(error.toString());

      emit(DiningErorrStates(error.toString()));
    });
  }
  void changeFa(userId, diningId )
  {
    // is_Active = !is_Active!;
    // if (is_Active == true) {
    //   MyColor = Colors.red;
    DioHelper.favorit(userId, productId);
    // } else {
    //   MyColor = Colors.grey;
    //
    // }
  }
}
