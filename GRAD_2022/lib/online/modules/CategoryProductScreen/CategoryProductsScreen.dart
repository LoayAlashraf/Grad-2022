import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Network/remote/dioo_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/variables.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../Details_Screen/details_screen.dart';


class CategoryProductsScreen extends StatelessWidget {

  CategoryProductsScreen(CategoryId){}

  @override
  Widget build(BuildContext context) {

    ProductCategoryList.clear();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context)=>ShopCubit()..getCategoryProductData(CategoryId),
      )
      ],
      child: BlocConsumer<ShopCubit,ShopState>(
          listener: (context, state) {},
          builder: (context,state){
            return  Scaffold(
              appBar: AppBar(),
              body: ConditionalBuilderRec(
                  condition: ProductCategoryList != null,
                  builder:(context)=> ProductsBuilder2(ProductCategoryList,context),
                  fallback:(context) => Center(child: CircularProgressIndicator())
              ),
            );
          }
      ),
    );
  }
  Widget ProductsBuilder2( ProductCategoryList,context ) =>
      SingleChildScrollView(
        child: Column(children: [
          GridView.count(crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.58,
            children: List.generate(
                ProductCategoryList!.length,
                    (index) => InkWell(
                  onTap: ()
                  async {
                    //navigateTo(context,DetailsScreen(productid=ProductList[index].id ));
                    productdetalsid=productid=ProductCategoryList[index]!.id;
                    await DioHelperr.GetDitailsData();
                    navigateTo(context, DetailsScreen());

                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Image(
                              image: NetworkImage(ProductCategoryList[index]!.image.toString()),
                              width: double.infinity,
                              height: 200.0,
                            ),
                            if(ProductCategoryList[index]!.discount !=0)
                              Container(
                                color: Colors.red,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                child: Text('DISCOUNT',
                                  style: TextStyle(
                                    fontSize: 8.0,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ProductCategoryList[index]!.name.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  height: 1.3,
                                ),
                              ),
                              Row(
                                children: [
                                  Text((ProductCategoryList[index]!.cost-((ProductCategoryList[index]!.discount/100)*ProductCategoryList[index]!.cost)).toStringAsFixed(2),
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.blue,
                                      )),
                                  SizedBox(width:5.0 ,),
                                  if(ProductCategoryList[index]!.discount.toString() != 0)
                                    Text(ProductCategoryList[index]!.cost.toString(),
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  Spacer(),
                                  IconButton(onPressed: (){},
                                    icon: CircleAvatar(
                                      radius: 15.0,
                                      backgroundColor: Colors.grey,
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 14.0,
                                        color: Colors.white,
                                      ),
                                    ),)

                                ],
                              )

                            ],),
                        )
                      ],
                    ),
                  ),
                )),
          )
        ],),
      );
}
