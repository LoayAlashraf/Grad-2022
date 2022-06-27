import 'package:flutter/material.dart';

class RulesRegulations extends StatefulWidget {
  const RulesRegulations({Key? key}) : super(key: key);

  @override
  State<RulesRegulations> createState() => _RulesRegulationsState();
}

class _RulesRegulationsState extends State<RulesRegulations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('RULES & REGULATIONS'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text('Shopping Centre Rules and Regulations',

                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 15,),
            Text('''As our valued customers’ safety and security are our main concern, and in our continuous efforts to provide a safe, secure and pleasant shopping environment, we highly appreciate your cooperation with the following:
                         
Smoking is not permitted inside the shopping centre at the areas of general use and inside the bathrooms.

Animals are not premitted inside the shopping centre.
                         
Wearing inappropriate/ unsuitable clothing is not permitted inside the shopping centre.

Public display of affection is not permitted inside the shopping centre.

Wearing apparel that has obscene language, obscene gestures, or racial / religious / ethnic slurs that are likely to create a disturbance is not permitted.

Any kind of alcoholic drinks is not permitted from entering the shopping centre.

Any kind of weapons, self-defense tools, sharp objects or metal is not permitted from entering the shopping centre.

The presence of unauthorized guests at emergency stairs and places under construction is not permitted.

Do not use any type of fireworks, bikes, balls, etc. inside the shopping centre.

On holidays, shopping centre entrance is limited to families only.

Food consumption in designated areas only (Restaurants / Food Court).

Please, do not litter.
                         ''',

              style: TextStyle(fontSize: 15.0 ,) ,
        ),
          ],),
        ),
      ),
    );
  }
}
