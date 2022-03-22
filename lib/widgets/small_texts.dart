import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  double height;

  SmallText({Key? key, required this.text,
    this.size = 12,
    this.overflow = TextOverflow.ellipsis,
    this.color = const Color(0xff100f0f),
    this.height = 1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: 'Roboto',
        height: height
      ),
    );
  }
}
