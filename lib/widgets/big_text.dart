import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  //Var declare
   Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText({Key? key,
    this.color = const Color(0xff100f0f),
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: size,
        color: color,
        fontFamily: 'Roboto'
      ),
    );
  }
}
