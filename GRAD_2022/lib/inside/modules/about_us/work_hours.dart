import 'package:flutter/material.dart';

class WorkingHours extends StatefulWidget {
  const WorkingHours({Key? key}) : super(key: key);

  @override
  State<WorkingHours> createState() => _WorkingHoursState();
}

class _WorkingHoursState extends State<WorkingHours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WORKING HOURS'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

          SizedBox(height: 5,),
          Text('Shopping Centre Working Hours',

            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,

            ),
          ),
          SizedBox(height: 15,),
          Text('Saturday - Wednesday: From 10:00 AM to 11:00 PM',

            style: TextStyle(
              fontSize: 15,


            ),
          ),
          SizedBox(height: 1,),
          Text('Thursday & Friday: From 10:00 AM to 12:00 PM',

            style: TextStyle(
              fontSize: 15,


            ),
          ),
          SizedBox(height:5 ,),
          Text('Restaurants and Cafes:',

            style: TextStyle(
              fontSize: 15,


            ),
          ),
          Text('All week days: From 10:00 AM to 1:00 AM',

            style: TextStyle(
              fontSize: 15,


            ),
          ),
            SizedBox(height: 15,),
            Text('Customer Service Hotline',

              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 15,),
            Text('16478',

              style: TextStyle(
                fontSize: 15,


              ),
            ),
            SizedBox(height: 15,),
            Text('Shopping Centre Gates',

              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(height: 15,),
            Text('Entry and Exit Gates: 1-3-4-5-6',

              style: TextStyle(
                fontSize: 15,


              ),
            ),
            SizedBox(height: 15,),
            Text('Entry only Gates: 7',

              style: TextStyle(
                fontSize: 15,


              ),
            ),
        ],),
      ),
    );
  }
}
