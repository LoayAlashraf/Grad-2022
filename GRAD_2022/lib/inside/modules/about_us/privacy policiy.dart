import 'package:flutter/material.dart';

class PrivacyPoliciy extends StatefulWidget {
  const PrivacyPoliciy({Key? key}) : super(key: key);

  @override
  State<PrivacyPoliciy> createState() => _PrivacyPoliciyState();
}

class _PrivacyPoliciyState extends State<PrivacyPoliciy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('PRIVECY POLICIY'),
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
              Text('Privacy Statement of CITYSTARS',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 15,),
            Text('''We have updated the CITYSTARS privacy policy on the Internet, mobile phones and websites, all digital applications and services, as well as the outstanding data collection, usage and data sharing methods on CITYSTARS, collaborating and non-collaborating sites. Please take the time to view our complete privacy statement when using any of our services, including read or visual content.
        
Thank you for visiting CITYSTARS website.
        
We will provide you with a privacy statement including an explanation of how to use the information available on the website, and the options available to you regarding your access to our information and the use of our services on the Internet or mobile phone, all of which provide for the privacy statement.    
                         ''', style: TextStyle(fontSize: 15.0 ,)
        ),
              SizedBox(height: 10,),
              Text('The information we provide',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 10,),
              Text('''The website provides all information and services to the users, such as a statement of the size of the projects run by CITYSTARS and the hotel, cultural, commercial and administrative services that the user gives when visiting the website, and the information automatically collected about the user, referred to in the privacy statement. "the information".
          
        1.The information we provide to you, the places you are looking for, the services, products and entertainment you wish to visit, enjoyment, family or guests, friends with occasional times, places that may benefit from the services or products you offer. You may provide us with personal information such as name, address, email address, telephone number, fax number, and information on the use of different products, programs, and services.
        
        2.Information obtained by the website automatically or indirectly: The website can use automated means to collect information different from the user, and his computer, or any other device used to enter the website. The list of information that automatically collects, for example, the network address or protocol, the type of browser used, the type of operating system you are using, the name and areas of use of the Internet service provider, the mobile network, the type of device you used to view the website's services, website and content information, which you entered to view, pass, or click on. For more information about how to collect previous information and how to use it. If you agree to such a group, in most cases, you will be able to stop collecting data at any time by accessing the privacy settings of your mobile device or through settings applied to mobile applications.
        
        3.The information we collect enables you to take advantage of the contents of the website, applications and other offers and share them on social networking sites, or on the Internet, such as Facebook, or other sites. When you share the content of a website or through social services sites, you may allow us to obtain certain information on your profile. This information may include your name, email address, photos, gender, date of birth, location, or user account files on social networking sites. For a description of how these sites and platforms are used and treated with your information, please refer to privacy policies. Its own terms and conditions of use which may allow you to modify your privacy settings. When we interact with you through the content of the CITYSTARS website, we may ask you to obtain any information about your interaction with such content, such as the content you have reviewed, and information about access to or content that you have viewed.
                                 
              ''', style: TextStyle(fontSize: 15.0 ,)
              ),
              SizedBox(height: 15,),
              Text('How we use information',

                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 10,),
              Text('''We, along with service providers, may use this information to:
        
        1.Provide you with information and communicate with us about our services or your account with us. 
        
        2.Meet your requests for our services, including other services.
        
        3.Respond to your questions and guide you to your desired destination.
        
        4.Communicate with you about the products our customers provide, our entertainment programs, and our services that we believe may be important to you.
        
        5.The implementation of legal terms (including the policies, terms and conditions) that contribute to the management of the use of our services, or the objectives for which such information is provided.
        
        6.Providing technical support for our services.
        
        7.Prevent scams or illegal activities (including intellectual property infringement) that may affect any of our services.
        
        8.Protect and secure the users of our sites.
        
        9.Customize ads, offers, and content submitted to you based on your traffic, use of our electronic services, telephone, apps, or technical platforms, and analyze the performance of these ads, offers, and content, as well as your interaction with them.
        
        10.Conduct analysis of how you use our services and components.
        
        11.Send gifts, cards, invitations, or emails if you use these services to recipients.

If you provide information about your account on our websites, this can help us do things like:

(I) provide us with exclusive content,

(2) to customize your experience with us within the scope of our services and beyond,

(3) communicate with you through social networking sites or directly by sending the latest news, special offers, prizes,

(4) Allow you to share your experience and the content you produce through social media sites. When you provide information about yourself through an application, one of our services, social networking sites, or other ISPs, you can be available to other subscribers,

We may incorporate any of the information we collect for any of the above reasons, and we may improve this information and integrate it with others. Please also be aware that if you agree to provide us with information or content for publication, we may post this information and content along with other information about you (such as name, account name, or location). In the event that you register or create an account within one of our services, the name you use and any other content you add to your account will be publicly posted through our Services and may be searched, found, and redistributed at our full discretion. Please review the Terms of Use for more details on using the content you submit.
                       
              ''', style: TextStyle(fontSize: 15.0 ,)
              ),
              SizedBox(height: 15,),
              Text('Exchange and disclosure of personal information We may disclose information to:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 10,),
              Text('''
        1.Our partners or other web sites (1) conduct research and analysis, (2) specialize in content creation, (3) provide technical and practical support and customer service, (4) conduct marketing support (via platforms such as e-mail or commercials), (5) meet users' requests, (6) host our services, forums, and e-communities, (7) host data, (8) send or support e-advertising,
        
        2.In response to legal proceedings, such as in response to a court order, a summons, a government or security request, or any similar request.
        
        3.Third parties for purposes such as investigating, preventing, or taking action (at our full disposal) regarding illegal activities, suspicious arrests, or situations involving potential threats to any person, us or our services, or any violation of our policies, laws, of any of the Terms of Use, in order to verify or endorse our policies regarding our Services.
        
        4.We may transfer the information or some of it in the event that any of our departments are subject to change, such as merger, acquisition or sale,
        
        5.We may share this information with Internet Service Providers or our customers through their websites or other websites to provide you with information about products and services and to improve and communicate with you about them.
        
        6.We may disclose personal information to third parties not covered by this privacy statement (for example, marketers, magazine publishers, retailers, participatory databases, and nonprofit organizations) that wish to market your products or services to you. If CITYSTARS discloses personal information, you will have the opportunity to withdraw or block such uses either when providing personal information or prior to disclosure of such information.If you have requested to receive our emails, and would prefer not to receive marketing information from this site, you may follow the "unsubscribe" instructions provided about the email marketing you receive from this site. Which provide opportunities for related products and services.
                 
              ''', style: TextStyle(fontSize: 15.0 ,)
              ),
              SizedBox(height: 15,),
              Text('Additional information about privacy',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 10,),
              Text('1.Related Services',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 15,),
              Text('Our site may contain ways to access other sites such as Facebook, Twitter, etc., where the practices in these sites differ from our practices, visitors should see the privacy notices of other sites and we have no control over the information provided to, By these sites.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
          SizedBox(height: 10,),
          Text('2.Our commitment to security',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,

            ),
          ),
              SizedBox(height: 15,),
              Text('We have put in appropriate place physical, electronic and administrative procedures to protect and assist in preventing unauthorized or unauthorized access, in order to maintain the security of the data and to use it properly. Although we have taken all appropriate measures to protect against unauthorized disclosure of information, we cannot assure you that the personal information we collect will not be disclosed in a manner inconsistent with this privacy statement.',
                style: TextStyle(
                  fontSize: 15,

                ),
              ),
              SizedBox(height: 10,),
              Text('3.How to contact us',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 10,),
              Text('''If you have any questions or concerns about the Privacy Statement on the Internet, you can contact the address of http://www.citystars-heliopolis.com.eg/en/privacy-policy, and request to stop sharing such information. That you may be asked to provide as additional information to verify your identity or to ensure that you have an email address.

If you have requested to receive our emails, and would prefer not to receive marketing information from this site, you may follow the "unsubscribe" instructions provided about the email marketing you receive from this site which provide opportunities for related products and services, we may share non-personal information with third parties.              
              ''',
                style: TextStyle(
                  fontSize: 15,


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
