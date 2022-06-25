import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/components/components.dart';
import '../modules/LayoutScreens/MyCart.dart';
import '../modules/searsh/SearchScreen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context , state){},
      builder: (context , state)
      {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('EASY MALL'),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                    },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context,
                        MyCartScreen());
                  },
                  icon: Icon(Icons.shopping_cart))
            ],
          ),
          body: cubit.bottomScreen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            onTap: (index)
            {
              cubit.changBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home,),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps,),
                  label: 'Categories'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite,),
                  label: 'Favorite'
              ),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.add_shopping_cart,),
              //     label: 'MyCart'
              // ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings,),
                  label: 'Settings'
              ),

            ],
          ),
        );
      } ,
    );
  }
}
