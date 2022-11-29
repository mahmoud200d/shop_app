import 'package:flutter/cupertino.dart';

class OnBoarding extends StatelessWidget {

   OnBoarding({
    Key? key,
    required this.image,
    required this.title,
    required this.body

  }) : super(key: key);

  String image;
  String title;
  String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image.asset(image)),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Text(
          body,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
