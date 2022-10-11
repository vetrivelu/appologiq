import 'package:appologiq/home_screen.dart';
import 'package:appologiq/palette.dart';
import 'package:flutter/material.dart';

class BottomRouter extends StatefulWidget {
  BottomRouter({Key? key}) : super(key: key);

  @override
  State<BottomRouter> createState() => _BottomRouterState();
}

class _BottomRouterState extends State<BottomRouter> {
  int currentIndex = 0;
  final List<Widget> widgets = [
    HomrScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widgets[currentIndex],
      bottomNavigationBar: ClipRRect(
        child: SizedBox(
          height: 95,
          child: Material(
            elevation: 0.25,
            borderOnForeground: true,
            color: const Color(0xffFFFFFF),
            shape: const RoundedRectangleBorder(),
            child: BottomNavigationBar(
                selectedIconTheme: IconThemeData(color: Palette.themeColor),
                unselectedIconTheme: const IconThemeData(color: Color(0xffA49EA5)),
                selectedLabelStyle: Palette.p3SemiBold.copyWith(fontSize: 12, color: Palette.themeColor),
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.navigation), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.shop), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
                ]),
          ),
        ),
      ),
    );
  }
}
