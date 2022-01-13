import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:puchong/Homepage.dart';




class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    ctx=context;
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
BuildContext ctx;
final String a= " Imagine leaving your home to witness gorgeous scenery, lush, natural, stunning plants, neat and tidy walkways, and relaxing water features. Are you looking for professional Gardener or garden maintenance services ? If you need garden maintenance services near me, we have the perfect solution for you. Make your garden gorgeous with design, installation tips from professionals that will make your garden awe-inspiring. A professional garden maintenance service will help in trimming, maintaining your garden at its best.";
final String b="Be it a container garden, native plants, rain garden, or hardscapes – expert installation, landscape design expertise, and high-level maintenance is something that you need. We are the gardening service with certification and design sense to revamp your boring garden into something impeccable. Unlike other gardening services. We aim to customize your garden with the popular leaf collection (Indoor Plants & Outdoor plants), immaculate design, and awe-inspiring beauty that will relax your mind, body, and soul. It isn't easy to find the top garden services companies because understanding the customer's requirements takes time, effort, and expertise. And to integrate these services with top-notch accuracy in a creative way requires years of experience.";
class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);
  final List<Widget> _pages = <Widget>[
    Scaffold(
      //appBar: AppBar(),
      body: Container(
        decoration: new BoxDecoration(
          color: const Color(0xffffffff),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: new AssetImage(
              'assets/pd.jpg',
            ),
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(

                      onPressed: (){
                        Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context)=>Homepage()));

                      },
                      style: OutlinedButton.styleFrom(
                        // backgroundColor: Colors.green,
                        side: BorderSide(width: 1.0, color: Colors.green ),
                      ),
                      child: Container(
                        alignment: Alignment.topRight,
                          width: 70,
                          child: Center(child: Text("Skip", textAlign: TextAlign.center, style: TextStyle(fontSize: 22,color: Colors.green),)))),
                ],
              ),
              SizedBox(height: 30,),
              Text("Welcome",textAlign: TextAlign.center,style:TextStyle(color: Colors.green, fontSize: 28,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Text("My Gardener",textAlign: TextAlign.center,style:TextStyle(color: Colors.green, fontSize: 35,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Text(a,textAlign: TextAlign.justify, style:TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w400),)
            ],
          ),
        ),
      ),
    ),
    new  Scaffold(
      //appBar: AppBar(),
      body: Container(
        decoration: new BoxDecoration(
          color: const Color(0xffffffff),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: new AssetImage(
              'assets/pd.jpg',
            ),
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Why You Should Get Professional Gardening Services?",textAlign: TextAlign.center,style:TextStyle(color: Colors.green, fontSize: 25,fontWeight: FontWeight.bold)),
              // SizedBox(height: 20,),
              // Text("Puchong Gardening Services",textAlign: TextAlign.center,style:TextStyle(color: Colors.green, fontSize: 35,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Text(b,textAlign: TextAlign.justify, style:TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w400),)
            ],
          ),
        ),
      ),
    ),
    Scaffold(
      //appBar: AppBar(),
      body: Container(
        decoration: new BoxDecoration(
          color: const Color(0xffffffff),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
            image: new AssetImage(
              'assets/pd.jpg',
            ),
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text("Why Choose us for Gardening Services?",textAlign: TextAlign.center,style:TextStyle(color: Colors.green, fontSize: 28,fontWeight: FontWeight.bold)),
              SizedBox(height: 40,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outline
                    , color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,

                  ),
                  Text("We Guarantee Your Satisfaction",textAlign: TextAlign.center,style:TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline
                    ,color: Colors.black,

                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Eco-Friendly Practices",textAlign: TextAlign.center,style:TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline
                    ,color: Colors.black,

                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Latest Technology",textAlign: TextAlign.center,style:TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline
                    ,color: Colors.black,

                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Online Gardening Services",textAlign: TextAlign.center,style:TextStyle(color: Colors.black, fontSize: 22,fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 50,),

              OutlinedButton(

                  onPressed: (){
                Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context)=>Homepage()));

              },
                  style: OutlinedButton.styleFrom(
                    // backgroundColor: Colors.green,
                    side: BorderSide(width: 2.0, color: Colors.green ),
                  ),
                  child: Container(
                  width: 200,
                  child: Center(child: Text("Continue", textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: Colors.green),))))

            ],
          ),
        ),
      ),
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics() ,
              controller: _controller,
              reverse: false,
              allowImplicitScrolling: false,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
            new Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: new Container(
                color: Colors.grey[800].withOpacity(0.5),
                padding: const EdgeInsets.all(20.0),
                child: new Center(
                  child: new DotsIndicator(
                    controller: _controller,
                    itemCount: 3,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
