import 'package:flutter/material.dart';

class buildCard extends StatelessWidget {
  const buildCard({
    super.key, required this.number, required this.title,
  });
  final String number;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$number",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Text("$title",style: TextStyle(fontSize: 20),)
        ],
      ),
      ),
    );
  }
}