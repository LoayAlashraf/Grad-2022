import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_2022/Network/remote/dio_helper.dart';
import 'package:grad_2022/inside/modules/dining/cafe_screen/cubit/cubit.dart';
import 'package:grad_2022/inside/modules/dining/cafe_screen/cubit/diningstates.dart';
import 'package:grad_2022/shared/variables.dart';
import '../information_screen/information_screen.dart';

class CafeScreen extends StatefulWidget {
  CafeScreen(din_id){}
  @override
  State<CafeScreen> createState() => _CafeScreenState(din_id);
}

class _CafeScreenState extends State<CafeScreen> {
  _CafeScreenState(din_id){}
 static List<bool> _isFavorited = List.filled(dininglist.length, false);
  List<String> din=['Cafes','Restaurant','FastFood'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${din[din_id!-1]}'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body:BlocProvider(
            create: (BuildContext context) =>
            Diningcubit()..diningId(din_id!),
            child: BlocConsumer<Diningcubit, DiningStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ConditionalBuilderRec(
                      condition: dininglist != null,
                      builder: (context) =>
                          builderWidget(dininglist, context),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()));
                })), );
  }
  Widget builderWidget(dininglist,context)=>
      ListView.builder(
          itemCount: dininglist.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(

              child: ListTile(
                leading: Container(
                  padding: EdgeInsets.all(10),
                  child: Image(
                    image: NetworkImage(
                      dininglist[index].logo.toString(),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () => setState(
                          () => _isFavorited[index] = !_isFavorited[index]),
                  icon: _isFavorited[index]
                      ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                      : Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dininglist[index].name.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20,
                        ),
                        Text(
                          'Level${dininglist[index].level}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () async{
                  diningdetailsid=diningid=dininglist[index]!.id;
                  await DioHelper.getdiningdetails();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InformationScreen()));
                },
              ),
            );
          });
}
