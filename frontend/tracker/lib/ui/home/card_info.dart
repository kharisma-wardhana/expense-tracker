import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tracker/shared/constants/size_constant.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.rotate(
          angle: -3.1415926535897932 / 8,
          child: Container(
            width: 250,
            height: 150,
            padding: EdgeInsets.all(Sizes.dimen_18),
            margin: EdgeInsets.all(Sizes.dimen_18),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: Sizes.dimen_20,
                  spreadRadius: Sizes.dimen_12,
                  color: Colors.blueAccent,
                ),
              ],
              color: Colors.blue,
              borderRadius: BorderRadius.circular(
                Sizes.dimen_18,
              ),
            ),
          ),
        ),
        Transform.rotate(
          angle: -3.1415926535897932 / 20,
          child: Container(
            width: 250,
            height: 150,
            padding: EdgeInsets.all(Sizes.dimen_18),
            margin: EdgeInsets.all(Sizes.dimen_18),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: Sizes.dimen_10,
                  spreadRadius: Sizes.dimen_2,
                  color: Colors.deepPurpleAccent,
                ),
              ],
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(
                Sizes.dimen_18,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(Sizes.dimen_18),
          margin: EdgeInsets.all(Sizes.dimen_18),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: Sizes.dimen_24,
                spreadRadius: Sizes.dimen_16,
                color: Colors.black.withOpacity(0.2),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 40.0,
                sigmaY: 40.0,
              ),
              child: Container(
                padding: EdgeInsets.all(Sizes.dimen_18),
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Sizes.dimen_16),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withOpacity(0.2),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("My Balance"),
                    ),
                    Container(
                      child: Text("Balance"),
                    ),
                    SizedBox(height: Sizes.dimen_18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text("Income"),
                        ),
                        Spacer(),
                        Container(
                          child: Text("Expense"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text("Income"),
                        ),
                        Spacer(),
                        Container(
                          child: Text("Expense"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
