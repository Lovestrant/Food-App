import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/widgets/small_texts.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  double size;
  final String text;
  final Color iconColor;
  final Color textColor;

  IconAndText({Key? key,
   required this.icon,
    this.size = 13,
    required this.text,
    required this.iconColor,
    required this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,size: size,),
        SizedBox(width: 5),
        SmallText(text: text, color: textColor,size: size,)
      ],
    );
  }
}
