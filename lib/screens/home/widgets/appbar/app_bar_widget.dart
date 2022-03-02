import 'package:app_quiz/core/core.dart';
import 'package:app_quiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({Key? key, required this.user})
      : super(
          key: key,
          preferredSize: const Size.fromHeight(250),
          child: SizedBox(
            height: 250,
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 161,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Hello, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const ComplicatedImageDemo(),
              ],
            ),
          ),
        );
}

final List<String> imgList = [
  'https://img.icons8.com/external-flat-adri-ansyah/344/external-covid19-corona-virus-flat-adri-ansyah-25.png',
  'https://img.icons8.com/external-flat-adri-ansyah/344/external-covid19-corona-virus-flat-adri-ansyah-6.png',
  'https://img.icons8.com/external-flat-adri-ansyah/344/external-covid19-corona-virus-flat-adri-ansyah-2.png',
  'https://img.icons8.com/external-flat-adri-ansyah/344/external-covid19-corona-virus-flat-adri-ansyah-12.png',
  'https://img.icons8.com/external-flat-adri-ansyah/344/external-covid19-corona-virus-flat-adri-ansyah-5.png',
  'https://img.icons8.com/external-flat-adri-ansyah/344/external-covid19-corona-virus-flat-adri-ansyah-18.png',
];

final List<Widget> imageSliders = imgList
    .map((item) => Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Image.network(item,
                          fit: BoxFit.cover, width: 1000.0)),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help',
                            style: AppTextStyles.body,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 80,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 140.0,
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: imageSliders,
        ),
      ],
    );
  }
}
