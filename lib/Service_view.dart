import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:puchong/ServiceModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

//copyrights reserved Hassan Khan https://www.fiverr.com/users/hassanjani77


class Service_view extends StatefulWidget {
  Service_Model _service_model;

  Service_view(this._service_model);

  @override
  _Service_viewState createState() => _Service_viewState(_service_model);
}

class _Service_viewState extends State<Service_view> {
  Service_Model _service_model;
  _Service_viewState(this._service_model);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Container(
              margin: EdgeInsets.only(right: 30),
              child: Text(
                '${_service_model.Name}',
                style: TextStyle(color: Colors.white),
              ),
            )),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF00b300),
                  const Color(0xFF006600),
                  const Color(0xFF00e600),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                // stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        // automaticallyImplyLeading: false,
      ),

      backgroundColor: Color(0xFFF3F7FC),
      body: SafeArea(
          child: Container(
         child: Column(
           children: [
             // Expanded(
             //     flex: 1,
             //     child: Row(
             //       children: [
             //         IconButton(onPressed: (){
             //           Navigator.pop(context);
             //         }, icon: Icon(Icons.arrow_back_ios))
             //       ],
             //     )),
             Expanded(
               // child: Image.network(
               //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLI1v2y135NqWm1ArgGruhThwGJOhkyNtOyw&usqp=CAU",
               //   fit: BoxFit.contain,
               //   width: double.infinity,
               // )
                 flex: 5,
                 child: Container(
                   height: double.infinity,
                   width: double.infinity,
                   child: CarouselSlider(
                     options: CarouselOptions(
                         height: double.infinity,
                         disableCenter: true,
                         autoPlay: true,
                         enlargeCenterPage: true,
                         enlargeStrategy:
                         CenterPageEnlargeStrategy.scale),
                     items: _service_model.images
                         .map((item) => Container(
                         margin:
                         EdgeInsets.only(top: 10, bottom: 10),
                         height: double.infinity,
                         child: ClipRRect(
                             borderRadius:
                             BorderRadius.circular(30.0),
                             child: CachedNetworkImage(imageUrl:item,
                                 fit: BoxFit.fill, width: 1000,
                                 progressIndicatorBuilder: (context, url, downloadProgress) =>
                             Container(
                             margin: EdgeInsets.only(
                             top: 200,
                             bottom: 200,
                               left: 100,
                               right: 100

                         ),
                         child: Center(
                           child: CircularProgressIndicator(
                             // backgroundColor: Color(0xFF000066),
                             backgroundColor: Colors.white,
                             valueColor:
                             new AlwaysStoppedAnimation<Color>(Color(0xFF006600)),
                           ),
                         ),


                             ),

                             ))))
                         .toList(),
                   ),
                 )),
             Expanded(
               flex: 3,
               child: Container(
                 padding:
                 EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                 width: double.infinity,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(20),
                         topRight: Radius.circular(20))),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     // Text(
                     //   "${_service_model.Name}",
                     //   style: TextStyle(
                     //     color: Color(0xFF006600),
                     //       fontWeight: FontWeight.w900, fontSize: 20),
                     // ),
                     SizedBox(
                       height: 5,
                     ),
                     // Text(
                     //   "${_service_model.Discription}",
                     //   style: TextStyle(
                     //       fontWeight: FontWeight.w600,
                     //       color: Colors.grey,
                     //       fontSize: 15),
                     // ),
                     Container(
                       child: Center(
                         child: Text(
                           "Your shortcut to a great looking lawn",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                               color: Color(0xFF006600),
                               fontWeight: FontWeight.w400, fontSize: 22),
                         ),
                       ),
                     ),

                     SizedBox(
                       height: 5,
                     ),
                     Container(
                       child: Center(
                         child: Text(
                           "Contact us for booking Your order",
                           textAlign: TextAlign.center,
                           style: TextStyle(
                               // color: Color(0xFF006600),
                               color: Colors.black,
                               fontWeight: FontWeight.w400, fontSize: 18),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Container(
                       alignment: Alignment.bottomCenter,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           OutlinedButton(
                             style: OutlinedButton.styleFrom(
                               backgroundColor: Color(0xFFEA4335),
                               side: BorderSide(width: 1.0, ),
                             ),
                             onPressed: (){
                               showAlertDialog(context);
                             },
                             child: Container(
                               width: MediaQuery.of(context).size.width/3,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   FaIcon(
                                       Icons.email_outlined,
                                     color: Colors.white,
                                   ),
                                   SizedBox( width: 10,),
                                   Text("Email",style: TextStyle(color: Colors.white),)
                                 ],
                               ),
                             ),
                           ),
                           SizedBox(width: 10,),
                           OutlinedButton(
                             style: OutlinedButton.styleFrom(
                               backgroundColor: Color(0xFF25D366),
                               side: BorderSide(width: 1.0, ),
                             ),                             onPressed: (){
                               launchWhatsApp();
                             },
                             child: Container(
                               width: MediaQuery.of(context).size.width/3,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   FaIcon(
                                     FontAwesomeIcons.whatsapp,
                                     color: Colors.white,
                                   ),
                                   SizedBox( width: 10,),
                                   Text("WhatsApp" , style: TextStyle(color: Colors.white),)
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                     )
                   ],
                 ),
               ),
             )
           ],
         ),
        ),
      ),

        // floatingActionButton: new FloatingActionButton(
        //     elevation: 0.0,
        //     child: new Icon(Icons.check),
        //     backgroundColor: new Color(0xFFE57373),
        //     onPressed: (){
        //       launchWhatsApp();
        //       //openwhatsapp();
        //     }
        // ),
    );
  }



  Widget itembuilder(int index) {
    // return Image.network(
    //   _service_model.images[index],
    //   fit: BoxFit.contain,
    //   width: double.infinity,
    // );
    return CachedNetworkImage(
      imageUrl: _service_model.images[index],
      fit: BoxFit.contain,
      width: double.infinity,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Container(
              margin: EdgeInsets.only(
                  top: 100,
                  bottom: 100
              ),
              child: CircularProgressIndicator(
            value: downloadProgress.progress,
            // backgroundColor: Color(0xFF000066),
            backgroundColor: Colors.white,
            valueColor:
            new AlwaysStoppedAnimation<Color>(Color(0xFF006600)),
          ),
          ),

    );
  }

  @override
  void dispose() {
    // TODO: Dispose an InterstitialAd object

    super.dispose();
  }

  @override
  void initState() {
  }

  //
  // openwhatsapp() async{
  //   LocationData locationData=await getLocation();
  //   final String googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=${locationData.latitude},${locationData.longitude}";
  //  // var whatsapp ="+601112124969";
  //   var whatsapp ="+923170477188";
  //   var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hell0 '${googleMapslocationUrl} url'";
  //   var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello: ")}";
  //   if(Platform.isIOS){
  //     // for iOS phone only
  //     if( await canLaunch(whatappURL_ios)){
  //       await launch(whatappURL_ios, forceSafariVC: false);
  //     }else{
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: new Text("whatsapp no installed")));
  //
  //     }
  //
  //   }else{
  //     // android , web
  //     if( Platform.isAndroid){
  //       await launch(whatsappURl_android);
  //     }
  //
  //     else{
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: new Text("whatsapp no installed")));
  //
  //     }
  //
  //
  //   }
  //
  // }

  launchWhatsApp() async {
    // LocationData locationData=await getLocation();
    // final String googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=${locationData.latitude},${locationData.longitude}";
    // var whatsapp ="+601112124969";

    final link = WhatsAppUnilink(
      phoneNumber: '+601112124969',
      // text: "Hey! I'm inquiring about the Gardening Service \n mylocation: $googleMapslocationUrl",
      text: "Hey! I'm inquiring about the Gardening Services",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch('$link');
  }


  Future<LocationData> getLocation() async {
    Location _locationTracker = Location();
    LocationData location;
    location = await _locationTracker.getLocation();
    return location;
  }

  launchEmail(String toMailId, String subject, String body) async {
     String googleMapslocationUrl="";
    if(checkedValue){
      LocationData locationData=await getLocation();
      googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=${locationData.latitude},${locationData.longitude}";

    }else{

    }

    final Email email = Email(
      body: checkedValue?'$body $googleMapslocationUrl':'$body',
      subject: '$subject',
      recipients: ['$toMailId'],
      // cc: ['$toMailId'],
      // bcc: ['$toMailId'],
      isHTML: false,
    );
    if(Platform.isAndroid){
      try{
        await FlutterEmailSender.send(email);

      }catch(exp){

      }
    }
    else
      {

      }



    // var url = 'mailto:$toMailId?subject=$subject&body=$body $googleMapslocationUrl';
    // if (Platform.isAndroid) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
String Fname,phoneno,address;
  bool checkedValue=false;
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel", style: TextStyle(fontSize: 20, color: Color(0xFFEA4335), fontWeight: FontWeight.bold)),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
        child: Text("Send Email", style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),),
        onPressed: () {

            launchEmail("khanshaheen353@gmail.com", "My Gardener", "Hey! I'm inquiring about the Gardening Service \n Name: $Fname \n Phone no: $phoneno \n Address: $address \n");
            Navigator.pop(context);



        });
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder:(context, setState) {
          return AlertDialog(
            title: Text("Please Enter Some Details to book your Order", textAlign: TextAlign.center, style: TextStyle(color: Colors.green),),
            content: Container(
              height: MediaQuery.of(context).size.height/3,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: 'Full Name'),
                    onChanged: (text) {
                      Fname=text;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: 'Phone no'),
                    onChanged: (text) {
                      phoneno=text;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(hintText: 'Address'),
                    onChanged: (text) {
                      address=text;
                    },
                  ),
                  SizedBox(height: 3,),
                  CheckboxListTile(
                    title: Text("Share Device Location"),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue;
                        print(newValue);
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                  )
                ],
              ),
            ),
            actions: [
              cancelButton,
              continueButton,
            ],
          );
        },);
      },
    );
  }
}
