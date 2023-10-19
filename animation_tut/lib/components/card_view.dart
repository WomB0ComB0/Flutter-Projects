import 'dart:math';

import 'package:animation_tut/components/card_view_shadow.dart';
import 'package:animation_tut/components/custom_circle_view.dart';
import 'package:animation_tut/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});
  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  int imageNumber = 1;
  List<int> generatedNumber = [];

  void randomNumber() {
    if (generatedNumber.length == 5) {
      generatedNumber.clear();
    }
    int randomNumber;
    do {
      randomNumber = Random().nextInt(5);
    } while (generatedNumber.contains(randomNumber));
    generatedNumber.add(randomNumber);
    setState(() {
      imageNumber = randomNumber;
    });
  }

  List<String> animalDetails = [
    faker.lorem.sentence(),
    faker.lorem.sentence(),
    faker.lorem.sentence(),
    faker.lorem.sentence(),
    faker.lorem.sentence(),
  ];
  List<String> animals = [
    "Cat",
    "Dog",
    "Elephant",
    "Lion",
    "Tiger",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: customLightGray,
        body: Center(
            child: SizedBox(
                width: 330,
                height: 570,
                child: Stack(
                  children: [
                    const CardViewShadow(),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: const LinearGradient(
                              colors: [
                                customDarkBlue,
                                customBlueLight,
                                customMediumBlue,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ))),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 32),
                              child: Text(
                                animals[imageNumber - 1],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 52,
                                    color: customColorWhite),
                              ),
                            ),
                            Text(
                              animalDetails[imageNumber - 1],
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: customColorWhite),
                              textAlign: TextAlign.left,
                            ),
                            Stack(
                              children: [
                                const CustomCircleView(),
                                Positioned.fill(
                                    child: Image.asset(
                                        "assets/image-$imageNumber.png",
                                        fit: BoxFit.contain))
                              ],
                            ),
                          ],
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                randomNumber();
                              },
                              child: const Text("Explore More")
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
