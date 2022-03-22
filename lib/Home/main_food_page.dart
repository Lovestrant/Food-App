import 'package:flutter/material.dart';
import 'package:flutter_food_app/utils/Colors.dart';
import 'package:flutter_food_app/widgets/big_text.dart';
import 'package:flutter_food_app/widgets/small_texts.dart';

import 'food_page_body.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 45, bottom: 15),
        padding: EdgeInsets.only(left: 20, right: 20),

        child: Column(
          children: [
             Container(
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(

                    children: [
                      BigText(text: "Kenya", color: AppColors.mainColor,size: 25),
                      Row(
                       children: [
                         SmallText(text: "Nairobi", color: AppColors.blueColor,size: 12),
                         Icon(Icons.arrow_drop_down_circle)
                       ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor

                      ),
                      child: Icon(Icons.search, color: AppColors.textColor,),

                    ),
                  ),
                ],
            ),
             ),
            FoodPageBody()
          ],
        ),
      ),

    );
  }
}
