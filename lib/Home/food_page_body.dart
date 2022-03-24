import 'package:dots_indicator/dots_indicator.dart';
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

  var curPagevalue = 0.0;
  double scaleFactor = 0.8;
  double height = 220;

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.9);


    @override
    void initState() {
      super.initState();
      pageController.addListener(() {
        setState(() {
          curPagevalue = pageController.page!;
        });
      });
    }
    @override
    void dispose() {
      pageController.dispose();
    }

    return Column(
      children: [
        SingleChildScrollView(
          child: Container(
            // color: AppColors.yellowColor,
            height: 320,
            margin: EdgeInsets.only(top: 20),
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _buildPageItems(position);
                }),
          ),
        ),

        new DotsIndicator(
        dotsCount: 5,
        position: curPagevalue,
        decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        ),

        SizedBox(height: 20,),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BigText(text: "Popular"),
            SizedBox(width: 20,),
            SmallText(text: "Food Pricing"),
          ],
        ),

        SizedBox(height: 20,),

        //List view to display list of Images and text
        Container(
          height: 100,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage("Assets/Images/food10.png"),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),

      ],
    );
  }

  Widget _buildPageItems(int index) {
    Matrix4 matrix = new Matrix4.identity();

    if(index == curPagevalue.floor()) {
      var curScale = 1 - (curPagevalue - index)* (1-scaleFactor);
      var curTransform = height*(1-curScale)/2;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)..setTranslationRaw(0, curTransform, 0);

    } else if(index == curPagevalue.floor() +1) {
      var curScale = scaleFactor - (curPagevalue - index +1)* (1-scaleFactor);
      var curTransform = height*(1-curScale)/2;

      matrix = Matrix4.diagonal3Values(1, curScale, 1)..setTranslationRaw(0, curTransform, 0);

    } else if(index == curPagevalue.floor() -1) {
      var curScale = 1 - (curPagevalue - index)* (1-scaleFactor);
      matrix = Matrix4.diagonal3Values(1, curScale, 1);
      var curTransform = height*(1-curScale)/2;

      matrix = Matrix4.diagonal3Values(1, curScale, 1)..setTranslationRaw(0, curTransform, 0);
    }else {
      var curScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, curScale, 1)..setTranslationRaw(0, height*(1-scaleFactor)/2, 1);
    }


    return Transform(
      transform: matrix,

      child: Stack(
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
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    offset: Offset(0,5),
                    blurRadius: 1.0
                  )
                ],
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
                            iconColor: AppColors.yellowColor
                        ),
                        SizedBox(width: 10,),

                        IconAndText(
                            icon: Icons.location_on,
                            text: "1.7Km",
                            iconColor: AppColors.blueColor
                        ),
                        SizedBox(width: 10),

                        IconAndText(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: AppColors.yellowColor
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
