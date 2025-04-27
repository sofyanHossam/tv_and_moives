import 'package:flutter/cupertino.dart';

class CategoryText extends StatelessWidget{
  final String title ;
  const CategoryText({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 16 , top: 12),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
        ),
      ),
    );
  }

}