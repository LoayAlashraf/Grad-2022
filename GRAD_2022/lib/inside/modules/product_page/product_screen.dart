import 'package:conditional_builder_rec/conditional_builder_rec.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/variables.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen(cat_id) {}
  @override
  State<ProductScreen> createState() => _CafeScreenState(cat_id);
}

class _CafeScreenState extends State<ProductScreen> {
  _CafeScreenState(cat_id) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocProvider(
          create: (BuildContext context) =>
              Productcubit()..getProducts_cat(cat_id!),
          child: BlocConsumer<Productcubit, ProductsSates>(
              listener: (context, state) {},
              builder: (context, state) {
                return ConditionalBuilderRec(
                    condition: productcategoryidlist != null,
                    builder: (context) =>
                        builderWidget(productcategoryidlist, context),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()));
              })),
    );
  }

  Widget builderWidget(productcategoryidlist, context) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.58,
                children: List.generate(
                    productcategoryidlist!.length,
                    (index) => Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: [
                                  Image(
                                    image: NetworkImage(
                                      productcategoryidlist[index]!
                                          .image
                                          .toString(),
                                    ),
                                    width: double.infinity,
                                    height: 200.0,
                                  ),
                                  if (productcategoryidlist[index]!.discount !=
                                      0)
                                    Container(
                                      color: Colors.red,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.0,
                                      ),
                                      child: Text(
                                        'DISCOUNT',
                                        style: TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productcategoryidlist[index]!
                                          .name
                                          .toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.3,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          productcategoryidlist[index]!
                                              .cost
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          'EGP',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 9.0,
                                              color: Colors.black54),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        if (productcategoryidlist[index]!
                                                .discount
                                                .toString() !=
                                            0)
                                          Text(
                                            productcategoryidlist[index]!
                                                .cost
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
              ),
            ),
          ],
        ),
      );
}
