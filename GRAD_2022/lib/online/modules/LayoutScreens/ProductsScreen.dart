import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Network/end_point.dart';
import '../../../Network/remote/dioo_helper.dart';
import '../../../shared/components/components.dart';
import '../../../shared/variables.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../Details_Screen/details_screen.dart';


class ProductsScreen extends StatefulWidget {

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? detailsimage;


  @override
  Widget build(BuildContext context) {
    bool? x;
    var size = MediaQuery.of(context).size;
    return BlocConsumer<ShopCubit,ShopState>(
        listener: (context, state) {},
        builder: (context,state)
        {
          return ConditionalBuilderRec(
              condition: ProductList != null,
              builder:(context)=> ProductsBuilder2(ProductList,context,x,size),
              fallback:(context) => Center(child: CircularProgressIndicator())
          );
        }
    );
  }

  Widget ProductsBuilder2( ProductList,context,x ,size) =>
      SingleChildScrollView(
        child: Column(children: [
          GridView.count(crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 1.5,
            crossAxisSpacing: 1.5,
            childAspectRatio: 1 / 1.80,
            children: List.generate(
                ProductList!.length,
                    (index) => InkWell(
                      onTap: ()
                      async {
                        productdetalsid=productid=ProductList[index]!.id;
                        // navigateTo(context,DetailsScreen(productid=ProductList[index]!.id  ));
                        //print(productid);
                       // await DioHelperr.getData(url: productsdetails,
                       //            query: {
                       //              "Id":ProductList[index]!.id
                       //            }).then((value)
                       //        {
                       //          //print(value.toString());
                       //          productdetailsmodel=Productdetailsmodel.fromJson(value!.data);
                       //          detailsimage = productdetailsmodel!.image.toString();
                       //          name=productdetailsmodel!.name.toString();
                       //          cost=productdetailsmodel!.cost.toString();
                       //          description=productdetailsmodel!.description.toString();
                       //          discount=productdetailsmodel!.discount.toString();
                       //          print (productdetailsmodel.toString());
                       //
                       //        }).catchError((error){
                       //          print(error.toString());});

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
                                    image: NetworkImage(ProductList[index]!.image.toString()),
                                  width: double.infinity,
                                  height: (size.height)/4,
                                  //height: 200,
                                ),
                                if(ProductList[index]!.discount !=0)
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
                                      ProductList[index]!.name.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      height: 1.3,
                                    ),
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text((ProductList[index]!.cost-((ProductList[index]!.discount*ProductList[index]!.cost)/100)).toStringAsFixed(2),
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.blue,
                                      )
                                      ),
                                      Text(
                                        'EGP',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9.0 ,
                                            color: Colors.black54
                                        ),
                                      ),
                                      SizedBox(width:5.0 ,),
                                      Spacer(),
                                      IconButton(onPressed: ()
                                      {

                                        setState(() {
                                          ProductList[index]!.inFav = !ProductList[index]!.inFav ;
                                        });
                                        if (ProductList[index]!.inFav == true){
                                          print(loginuserId);
                                        ShopCubit.get(context).changeFav(
                                            userId=loginuserId,
                                            productId=ProductList[index].id,
                                            productName=ProductList[index].name.toString(),
                                            productImage=ProductList[index].image.toString(),
                                            productDiscount=ProductList[index].discount.toString(),
                                            productCost=ProductList[index].cost.toString(),
                                            producCount=ProductList[index].count.toString(),
                                            is_Cart=false,
                                            );
                                        //print(ProductList[index]!.inFav);
                                          print('add product to fav done');
                                        }
                                        else{
                                          DioHelperr.postData(url: DeleteByProductIdAndUserId
                                              ,query:
                                              {
                                                "Id": ProductList[index].id,
                                                "UserId" : loginuserId
                                              }
                                              ).then((value) {
                                                print('remove done');
                                              }).catchError((error){
                                                print(error.toString());});
                                         // print(ProductList[index]!.inFav);
                                       }
                                      },
                                        icon: CircleAvatar(
                                        radius: 15.0,
                                        backgroundColor: (ProductList[index]!.inFav== true)? Colors.red: Colors.grey,
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 14.0,
                                          color: Colors.white,
                                        ),
                                      ),)

                                    ],
                                  ),
                                  if(ProductList[index]!.discount != 0)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(ProductList[index]!.cost.toString(),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                        Text(
                                          'EGP',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 9.0 ,
                                              color: Colors.black54
                                          ),
                                        ),
                                      ],
                                    ),

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
