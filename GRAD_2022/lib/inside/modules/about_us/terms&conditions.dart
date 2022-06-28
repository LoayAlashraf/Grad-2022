import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('TERMS & CONDITIONS'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Terms and conditions of use',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 15,),
              Text('This website is owned and operated by CityStars. Please read carefully the terms and conditions below which constitute the terms and conditions of use of this website. Your use of this website means your explicit acceptance of the principles set out in the privacy policy of Citystars Management and Real Estate Consulting Co. S.A.E". If you do not accept the Privacy Policy, please do not browse the website, as continuance to use CITYSTARS and / or the websites of its affiliates following the change of these terms means that you accept such implied changes.',

                style: TextStyle(
                  fontSize: 15,


                ),
              ),


              SizedBox(height: 20,),
              Text('Citystars Heliopolis is a living landmark in Cairo that operates on a number of different levels. There are four components in all; shopping and entertainment, offices, residential and hospitality with three international hotels; Intercontinental Cairo Citystars, Holiday Inn Cairo Citystars and Staybridge Suites Cairo Citystars.',
                style: TextStyle(
                  fontSize: 15,

                ),
              ),
              SizedBox(height: 20,),
              Text('1.User commitment',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 15,),
              Text('By using or visiting this website you acknowledge and accept these terms and conditions set forth by CITYSTARS from time to time. Your access to the site, your sharing or downloading of materials from the Website indicates your acceptance to be bound by such Terms and Conditions, and CITYSTARS is entitled to change these terms by posting them through the Website. You must then indicate acceptance of and compliance with these Terms.  If there is a conflict between these terms and conditions and the rules and/or certain specific terms of use posted on the website concerning a specific information, the latter shall be in effect.',

                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 15,),
              Text('2.Terms of use',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
            SizedBox(height: 15,),
            Text('''The use of this website is permitted for legitimate purposes and in a manner that does not violate the law or any rights or restrictions on the use of this website. These restrictions include: no verbal harassment, no abuse and no attempted defamation and/or non-use of obscene and offensive language against a specific or non-specific third party, or any other conduct which may be considered inappropriate and contrary to public order.

You hereby undertake that you have full legal competence and that you aware of all behaviors, actions or words from you, and that you have no mental impediment or affliction preventing you from accessing and using this website. You further acknowledge that you are able to read and comply with these terms and conditions.
                       ''', style: TextStyle(fontSize: 15.0 ,) , ),
              SizedBox(height: 15,),
              Text('3.Display of data',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 15,),
            Text('''There are various parts of the website that allow the user to display his personal data and broadcast them on this website, hereinafter referred to as "User Submission", including personal data, audio and visual materials and opinions, but under the following conditions:
            
3.1. When you display any material on CITYSTARS website, you accept the provision of an unlimited and irrevocable license to CITYSTARS, by which it is entitled to use, distribute, modify or delete parts of what is displayed as a sole right of discretion for CITYSTARS without reference to you.
    
3.2. CITYSTARS website can use User Offers for any purpose that the Website finds proper, and the user accepts this without any legal liability on the website. If user offers include any sexual insinuations or political comments, the legal responsibility for them shall be borne by the user.

3.3. The user solely bears all responsibility resulting from the display of his/her data, and for any claims or damages and the third party (the operator) rights or third parties, and for any legal disposal or action arising from the use and display of the material on this website.        

3.4 By displaying the materials, you hereby undertake and confirm that you have all rights to display the materials and that you have obtained all licenses, rights and authorizations necessary to use and authorize CITYSTARS to use any displayed material, including patent rights, trademarks, trade secrets, copyrights or other proprietary rights.

3.5 You undertake that you will not diplay or disclose on this website any information or data that are protected by copyright, or trade secrets or third party proprietary rights including privacy and copyright, unless all rights to publish the materials are obtained from their owners, and the mentioned authorization is submitted to CITYSTARS website.

3.6. You also undertake not to display any material or information deemed illegal, defamatory, obscene, political or threatening, or that incites hatred or racism, or that is incentive motivation to commit a crime and entails civil liability, violation of law, cultural norms, or internationally accepted standards and moral rules.

3.7.  You must grant CITYSTARS an exclusive, free and irrevocable authorization to broadcast, display, resubmit, edit, delete, and sell the materials or information you display on the Website without limitation, by any means whatsoever in the sole discretion of CITYSTARS website. This authorization is not limited to a specific period of time or a certain place.

3.8. CITYSTARS website has the right and sole discretion to display the materials on the website, and it is not obliged in any case to display all or part thereof on the website.

                        ''', style: TextStyle(fontSize: 15.0 ,) , ),
              SizedBox(height: 15,),
              Text('4.Copyright and intellectual property',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
            SizedBox(height: 15,),
            Text('''All names, images, logos and trademarks of CITYSTARS website or any of its associated companies or any third party and its products and services are deemed trademarks owned by CITYSTARS and by all its associated companies or third parties.

No provision of this document may in any case be construed as granting to the right or license any trademark or franchise of CITYSTARS, its affiliates or any third party.

All copyrights, trademarks and other intellectual property rights on this Website (including design and organization) and all materials and content provided as part of the Website will always be the property of CITYSTARS or its licensors.

By accessing this website, you agree to do so for your personal use only and not for commercial use.

You may not agree to authorize or assist third parties to copy, upload, transmit, store (in any other location), distribute, broadcast, publish or exploit any material or content in a commercial manner or modify it without the prior written permission of the CITYSRTARS official.            
                         ''',
                style: TextStyle(fontSize: 15.0 ,)),
              SizedBox(height: 15,),
              Text('5- Limitation of Liability',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
            SizedBox(height: 15,),
            Text('''Under this, you agree that you are solely responsible for your use of this website. The maximum extent permitted by law, the CITYSTARS and its employees and agents in charge of them and do not bear the responsibility associated with this website guarantees, whether explicitly or implicitly.

CITYSTARS website does not guarantee any content sent to it through this website as being in conformity with accepted social, cultural and ethical standards. And does not undertake that the material on User Submissions does not infringe the rights of third parties.

While CITYSTARS does not monitor "User Submissions", you are fully responsible for obtaining the third party rights and all official approvals required to submit any material. You hereby bear all liability for damages and costs that may arise from your use of this website.

This website, information, names, images, notices and icons pertaining to this website or any other sites owned or operated by CITYSTARS and / or its affiliates and products and services (or the products and services of others) are based on "AS IS" and in accordance with AS AVAILABLE "WITHOUT WARRANTY, OR WITHOUT WARRANTY OF ANY KIND,

The data and information available from this website may contain inaccurate information and typographical errors, and the site does not represent the accuracy, completeness or reliability of any statement or information provided by this website.

You acknowledge that you will bear sole risk of any reliance on such statement or information.

CITYSTARS website will not be responsible in any way for any damage that may include errors and deletions, direct damages or indirect, or any damages that may arise from the use of or inability to use or benefit from the data whether it is due to the error of intentional or others have or negligence or any other reason related to using the website.

CITYSTARS does not warrant the quality of the goods or products offered by the exhibitors at the commercial center or the correctness of the information provided by the users of this website or its credibility.

CITYSTARS does not guarantee the full effectiveness, accuracy or reliability of any published material. CITYSTARS may delete, alter, and suspend any aspect of the Website, including the availability of any property of the Site at any time without notice.
            
                        ''', style: TextStyle(fontSize: 15.0 ,) ,
        ),
              SizedBox(height: 15,),
              Text('6.Compensation',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
            SizedBox(height: 15,),
            Text('''You must agree to indemnify CITYSTARS and all its employees, affiliates and affiliates from any claims, damages and expenses arising out of your access to this Website or because of the User Submissions.

You acknowledge that when you use this website, you will encounter the contents of User Submissions from various sources and acknowledge that such content may be inaccurate and dishonest. You hereby waive any legal rights or means you hold against CITYSTARS and agree not to sue its founders, founders, affiliates or employees.
            
                         ''', style: TextStyle(fontSize: 15.0 ,)
        ),
              SizedBox(height: 15,),
              Text('7.Law and jurisdiction',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
            SizedBox(height: 15,),
            Text('''These Terms and Conditions are governed by the laws of the Arab Republic of Egypt. Disputes are settled exclusively in Egyptian courts. Any legal claim relating to your use of this website must be initiated within one year from the date the lawsuit arises.

If one of these conditions or provisions is to be considered illegal, invalid or can not be implemented by law in any country where these terms and conditions are in force, that provision which is deemed by the courts to be invalid and ineffective will be removed from The remaining conditions are binding and in force.            
                         ''', style: TextStyle(fontSize: 15.0 ,)
        ),
            ],
          ),
        ),
      ),
    );
  }
}
