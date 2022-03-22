import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/utils/Colors.dart';
import 'package:flutter_food_app/widgets/big_text.dart';
import 'package:flutter_food_app/widgets/icon_and_text.dart';
import 'package:flutter_food_app/widgets/small_texts.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.9);
    return Container(
      color: AppColors.yellowColor,
      height: 320,
      margin: EdgeInsets.only(top: 20),
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItems(position);
          }),
    );
  }

  Widget _buildPageItems(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 9,right: 9),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven?Color(0xff69c5df): Color(0xff929294cc),
            image: DecorationImage(
                image: AssetImage("Assets/Images/food3.jpg")
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 150,
            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.whiteColor
            ),
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   BigText(text: "Bitter Orange",color: AppColors.textColor),
                   SizedBox(height: 10,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.blueColor,size: 15,)),
                      ),
                      SizedBox(width: 10),
                      SmallText(text: "4.5",size: 10,),
                      SizedBox(width: 10),
                      SmallText(text: "1287",size: 10,),
                      SizedBox(width: 10),
                      SmallText(text: "comments",size: 10,)
                    ],
                  ),
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      IconAndText(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColors.yellowColor,
                          textColor: AppColors.textColor),
                      SizedBox(width: 10,),

                      IconAndText(
                          icon: Icons.location_city_sharp,
                          text: "1.7Km",
                          iconColor: AppColors.blueColor,
                          textColor: AppColors.textColor),
                      SizedBox(width: 10),

                      IconAndText(
                          icon: Icons.punch_clock_rounded,
                          text: "32min",
                          iconColor: AppColors.yellowColor,
                          textColor: AppColors.textColor)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
