import 'dart:math';

import 'package:appologiq/bigwidget.dart';
import 'package:appologiq/data.dart';
import 'package:appologiq/palette.dart';
import 'package:appologiq/tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomrScreen extends StatefulWidget {
  HomrScreen({Key? key}) : super(key: key);

  @override
  State<HomrScreen> createState() => _HomrScreenState();
}

class _HomrScreenState extends State<HomrScreen> {
  bool isFavorite = false;
  bool isNotification = false;
  final scrollController = ScrollController();

  int currentIndex = 0;

  @override
  void initState() {
    scrollController.addListener(() {
      // print(scrollController.position.pixels);
      if (scrollController.position.pixels < 190) {
        refresh(() {
          index = 0;
        });
      } else {
        refresh(() {
          index = 1;
        });
      }
    });
    super.initState();
  }

  int index = 0;
  late void Function(void Function()) refresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                height: 200,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppBar(
                    backgroundColor: Colors.white,
                    leading: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/ProfilePic.png'),
                      ),
                    ),
                    elevation: 0,
                    actions: [
                      IconButton(
                        icon: isFavorite
                            ? const Icon(
                                Icons.favorite_outline_rounded,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      )
                    ],
                    title: ListTile(
                      title: RichText(
                        text: TextSpan(
                          text: 'Hey ',
                          style: Palette.p2SemiBold,
                          children: [TextSpan(text: 'mr.miyagi', style: Palette.p2SemiBold.copyWith(color: Palette.themeColor))],
                        ),
                      ),
                      subtitle: Text('What’s your plan?', style: Palette.p3regualr),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                    bottom: PreferredSize(
                        preferredSize: const Size(double.maxFinite, 100),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))), prefixIcon: Icon(Icons.search)),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            StatefulBuilder(builder: (context, reload) {
              refresh = reload;
              return Column(
                children: [
                  SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
                          child: Card(
                              elevation: 0.25,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: SizedBox(
                                height: 144,
                                width: MediaQuery.of(context).size.width - 64,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Icon(Icons.celebration_rounded, color: Palette.themeColor),
                                        ),
                                        Text(
                                          "Giveaway alert!",
                                          style: Palette.p2SemiBold.copyWith(color: Palette.themeColor),
                                        )
                                      ],
                                    ),
                                    ListTile(
                                      title: Text('FREE MASSAGE GIVEAWAY', style: Palette.p3SemiBold),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                        child: Text('👍 Like the teacher’s day giveaway for a chance to win.', style: Palette.p3SemiBold),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            height: 152,
                            width: MediaQuery.of(context).size.width - 64,
                            child: Card(
                                elevation: 0.25,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 16),
                                              child: Icon(FontAwesomeIcons.dice, color: Palette.themeColor),
                                            ),
                                            Text(
                                              "Not sure what to do",
                                              style: Palette.p2SemiBold.copyWith(color: Palette.themeColor),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text("Let us help you pick the right place", style: Palette.p3regualr),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: SizedBox(
                                          height: 48,
                                          width: MediaQuery.of(context).size.width - 102,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Palette.themeColor),
                                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                                            child: Text(
                                              "Let's do something fun",
                                              style: Palette.buttonTextStyle.copyWith(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PageIndicator(index: index),
                      ],
                    ),
                  ),
                ],
              );
            }),
            getTitle(headIcon: Icons.star_border, headerText: 'Recomendded for you', title: 'Things to do', data: thingstodo),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: thingstodo
                  .map((e) => Tile(
                      title: e["title"].toString(),
                      subtitle: e["subtitle"]?.toString(),
                      children: (e["children"] as Map<IconData, String>)
                          .keys
                          .map((key) => Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      key,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Text((e["children"] as Map<IconData, String>)[key] ?? '',
                                        style: Palette.p4regualr.copyWith(color: const Color(0xffA49EA5)))
                                  ],
                                ),
                              ))
                          .toList()))
                  .toList(),
            ),
            const SizedBox(height: 60),
            getTitle(headIcon: Icons.lightbulb_outline_rounded, headerText: 'Featured', title: 'Business', data: thingstodo),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: business
                  .map((e) => Tile(
                      title: e["title"].toString(),
                      children: (e["children"] as Map<IconData, String>)
                          .keys
                          .map((key) => Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      key,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Text((e["children"] as Map<IconData, String>)[key] ?? '',
                                        style: Palette.p4regualr.copyWith(color: const Color(0xffA49EA5)))
                                  ],
                                ),
                              ))
                          .toList()))
                  .toList(),
            ),
            const SizedBox(height: 60),
            getTitle(headIcon: Icons.star_border, headerText: 'Recomendded for you', title: 'Upcoming events'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: upcomingEvents
                  .map((e) => Tile(
                      title: e["title"].toString(),
                      subtitle: e["subtitle"]?.toString(),
                      children: (e["children"] as Map<IconData, String>)
                          .keys
                          .map((key) => Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      key,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 8),
                                    Text((e["children"] as Map<IconData, String>)[key] ?? '',
                                        style: Palette.p4regualr.copyWith(color: const Color(0xffA49EA5)))
                                  ],
                                ),
                              ))
                          .toList()))
                  .toList(),
            ),
            const SizedBox(height: 60),
            getTitle(headIcon: Icons.favorite_border, headerText: 'Loved by users', title: 'Miniguides'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AspectRatio(
                aspectRatio: 0.90,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  children: places
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.black,

                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    image: NetworkImage(
                                      'https://picsum.photos/id/${Random().nextInt(400) + 300}/${Random().nextInt(300) + 200}/${Random().nextInt(400) + 300}',
                                    )),
                                // backgroundBlendMode: BlendMode.dstATop,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(e, style: Palette.p2SemiBold.copyWith(color: Colors.white, fontSize: 24)),
                                    Text("31 Listings", style: Palette.p2SemiBold.copyWith(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "See all mini guides",
                  style: Palette.buttonTextStyle.copyWith(color: Palette.themeColor),
                )
              ],
            ),
            const SizedBox(height: 60),
            getTitle(headIcon: Icons.thumb_up_outlined, headerText: 'Popular', title: 'Popular Categories'),
            AspectRatio(
              aspectRatio: 1,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 1,
                children: popularCategories
                    .map((e) => Card(
                          elevation: 0.25,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(e["icon"].toString()),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(e["name"].toString(), style: Palette.p3SemiBold),
                              ),
                              Text(
                                "${e["listings"]} Listings",
                                style: Palette.p4regualr.copyWith(color: const Color(0xffA49EA5)),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column getTitle({
    required final IconData headIcon,
    required final String headerText,
    required final String title,
    final String? subtitle,
    final dynamic data,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(
                headIcon,
                color: Color(0xffA49EA5),
              ),
              const SizedBox(width: 16),
              Text(headerText, style: Palette.p4regualr.copyWith(color: Color(0xffA49EA5))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            title,
            style: Palette.h2.copyWith(color: Color(0xff473B4A)),
          ),
        ),
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          height: 8,
          width: index == 0 ? 32 : 8,
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            // border: Border.all(),
            borderRadius: BorderRadius.circular(8),
            color: index == 0 ? Colors.deepOrange : Colors.grey,
          ),
        ),
        const SizedBox(width: 4),
        AnimatedContainer(
          height: 8,
          width: index == 1 ? 32 : 8,
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            // border: Border.all(),
            borderRadius: BorderRadius.circular(8),
            color: index == 1 ? Colors.deepOrange : Colors.grey,
          ),
        ),
      ],
    );
  }
}
