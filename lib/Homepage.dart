import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:puchong/ServiceModel.dart';

import 'Service_view.dart';


class Homepage extends StatefulWidget {
//  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              'Services',
              style: TextStyle(color: Colors.white),
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
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 5,right: 5),
        child: FutureBuilder<List<Service_Model>>(
          future: Getservices(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Container(child: Center(child:  CircularProgressIndicator(
                // backgroundColor: Color(0xFF000066),
                backgroundColor: Colors.white,
                valueColor:
                new AlwaysStoppedAnimation<Color>(Color(0xFF006600)),
              ),));
            }else{
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1),
                itemCount: snapshot.data.length,

                itemBuilder: (context, index) {
                  return Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 5,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Service_view(snapshot.data[index])));
                      },
                      child: Container(
                        // alignment: Alignment.center,
                       // margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10) ),
                                child: CachedNetworkImage(imageUrl: snapshot.data[index].Pic,
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

                                  width: double.infinity, height: 160, fit: BoxFit.cover,)),
                            SizedBox(height: 10,),
                            Text("${snapshot.data[index].Name}", textAlign: TextAlign.center, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                          ],
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF00b300),
                                const Color(0xFF006600),
                                const Color(0xFF00e600),                          ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),                        ),
                            borderRadius: BorderRadius.circular(10)

                        ),
                      ),
                    ),
                  );

              },);
            }
          },
        ),

      ),
    );
  }


   Future<List<Service_Model>>  Getservices() async {
     List<Service_Model> ServiceList=[];
     ServiceList.clear();
  QuerySnapshot querySnapshot= await  FirebaseFirestore.instance.collection('Services').orderBy("sno", descending: false).get();
   if(querySnapshot.docs.isEmpty){
   }else{
   querySnapshot.docs.forEach((doc) {
     Service_Model R_data = new Service_Model(
       doc.id,
       doc["Description"],
       doc["Name"],
       doc["Image"],
       doc["Images"],
     );

     ServiceList.add(R_data);

   });
   }
   print(ServiceList.length);
  return ServiceList;

   }


}
