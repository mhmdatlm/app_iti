import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: Text(
              "about app" ,
               style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold, 
            ),
            ),
            body: "Welcome to the program!This store is designed specifically to help you spend your envelopes with ease and pleasure.Once you search for the product you want, it will show you immediately and with a range of other related products that also have the quality of its industry and the security of its use.Wealways offer you a simple thing that we can save you time and help you choose the best things.",
             
          ),
          PageViewModel(
            titleWidget: Text(
              "about us" ,
               style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold, 
            ),
            ),
             body:"This app is designed by a group of premium programmers in the application software to help you and solve your problems. One of them is the search for a particular product and waste a lot of time. We are here to help you with your developers:Mohammed Al-Hawsari Mohammed Atlam Karam Walid Amani Nasser"
          ),
        ],
        onDone: () {
          Navigator.pushNamed(context, "home");
        },
        onSkip: () {
          Navigator.pushNamed(context, "home");
        },
        showSkipButton: true,
        skip: Text (
          'Skip' ,
         style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color.fromARGB(248, 6, 63, 235),
         ),
         ),
         next: Icon (Icons.arrow_forward,
         color: Color.fromARGB(0, 8, 153, 211),
         ),
         done: Text ('Done' ,
         style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color.fromARGB(248, 6, 63, 235),
      ),
         ),
         dotsDecorator: DotsDecorator(
          size: Size.square(10.0),
          activeSize: Size(20.0, 10.0),
          color: Colors.black26,
          activeColor: const Color.fromARGB(255, 8, 73, 126),
          spacing: EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
         ),
      ),
    );
  }
}