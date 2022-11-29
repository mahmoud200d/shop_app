import 'package:flutter/material.dart';
import 'package:shop_app/network/shard_pref.dart';
import 'package:shop_app/screen/auth/login_screen.dart';
import 'package:shop_app/widget/on_bording.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);


  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController=PageController();
 bool isLast=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(onPressed: (){
          submit();

                Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()) );




          }, child: Text('SKIP'))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(
            child: PageView(
              onPageChanged: (int index){
               if(index==2){
                 setState(() {
                   isLast=true;
                 });
               }else{
                 setState(() {
                   isLast=false;
                 });
               }

              },
              controller: pageController,
              physics: BouncingScrollPhysics(),
          children: [
            OnBoarding(image:'images/page1.png',title:'On Board 1Title' ,body: 'On Board 1Body '),
            OnBoarding(image:'images/page2.png',title:'On Board 2Title' ,body: 'On Board 2Body '),
            OnBoarding(image:'images/pag3.png',title:'On Board 3Title' ,body: 'On Board 3Body ')
          ],
            ),
          ),
         SizedBox(height: 40,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.blue,
                dotHeight: 10,
                expansionFactor: 4,
                dotWidth: 10,
                spacing: 5,

              ),
               onDotClicked: (int index){
                pageController.nextPage(duration: Duration(microseconds: 850), curve: Curves.fastLinearToSlowEaseIn);
              },
                controller: pageController, count:3 ),

             FloatingActionButton(
                 onPressed: (){


                if(isLast){
                  submit();
                }
                else{
                  pageController.nextPage(duration: Duration(microseconds: 850), curve: Curves.fastLinearToSlowEaseIn);


                }
                 },child:  Icon(Icons.arrow_forward_ios)
             ),
           ],
         )


          ],
        ),
      ),
    );
  }

  void submit(){
    SharedPref.savaData(key: '/onBoarding_screen', value: true).then((value) {
      if(value){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()) );
      }
    });
  }
}

