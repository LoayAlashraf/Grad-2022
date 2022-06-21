
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grad_2022/inside/modules/product_page/cubit/state.dart';

import '../../../../Network/remote/dio_helper.dart';
import '../../../../shared/variables.dart';
import '../../../models/gategoryidresponse.dart';

class Productcubit extends Cubit<ProductsSates> {
  Productcubit() : super(ProductsIntialStates());

  static Productcubit get(context) => BlocProvider.of(context);

  GategoryIdResponse? gategoryIdResponse;

  void getProducts_cat(int cat_id) {
    productcategoryidlist.clear();
    emit(ProductsGetProductLoadingStates());
    DioHelper.FindByIdCategory(
        url: '/Products/GetProductByCategoryId',
        query: {"Id": cat_id}).then((value) {
      for (int i = 0; i < value!.data.length; i++) {
        gategoryIdResponse = GategoryIdResponse.fromJson(value.data[i]);
        productcategoryidlist.add(gategoryIdResponse!);
      }

      emit(ProductsGetProductSuccesssStates());
    }).catchError((error) {
      print(error.toString());

      emit(ProductsGetProductErorrStates(error.toString()));
    });
  }
}
