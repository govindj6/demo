import 'dart:ui';

import 'package:flutter/material.dart';

import 'NewsResponse.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget(
      {Key? key, required this.index,required this.newsItem, required this.listener})
      : super(key: key);

  final Items? newsItem;
  final int index;
  final CardStackListener listener;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity != 0.0) {
            if (details.primaryVelocity! < 4) {
              listener.addCard(newsItem, index);
            } else {
              listener.removeCard(this, index);
            }
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff989898), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        child: Image.network(
                            getProperString(newsItem?.images?.first?.image),
                            width: double.maxFinite,
                            height: 220,
                            fit: BoxFit.fill),
                      ),
                      Container(
                        height: 220.0,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Color.fromARGB(0, 0, 0, 0),
                                  Color(0xff212b33),
                                ],
                                stops: [
                                  0.0,
                                  1.0,
                                ])),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                        color: Color(0xff212b33),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(getProperString(newsItem?.title!),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18)),
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Text("Description")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 65.0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(17),
                        bottomLeft: Radius.circular(17)),
                    color: Color.fromARGB(50, 0, 0, 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              /*Text(
                            "#ed by Govind Jha",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'DM mono',
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(50, 255, 255, 255),
                                fontSize: 16.0,
                            ),
                          )*/
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 45.0,
                                height: 45.0,
                                padding: const EdgeInsets.all(11),
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xf4dffffff),
                                      width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  color:
                                      const Color.fromARGB(20, 255, 255, 255),
                                ),
                                child: const Image(
                                  image: AssetImage(
                                      'assets/img_saved_bookmark.png'),
                                ),
                              ),
                            ),
                            Container(
                              width: 45.0,
                              height: 45.0,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xf4dffffff), width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                color: const Color.fromARGB(20, 255, 255, 255),
                              ),
                              child: const Image(
                                image: AssetImage('assets/img_ic_share.png'),
                              ),
                            ),
                            Container(
                              width: 45.0,
                              height: 45.0,
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xf4dffffff), width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                color: const Color(0xff3a76f0),
                              ),
                              child: const Image(
                                image: AssetImage('assets/img_ic_signal.png'),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  String getProperString(String? txt) {
    String properString = "";
    if (txt?.isNotEmpty == true) {
      properString = txt!;
    }
    return properString;
  }
}

abstract class CardStackListener {
  void addCard(Items? newsItem, int position);

  void removeCard(Widget newsItem, int position);
}
