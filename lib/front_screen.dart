import 'package:appologiq/bottom_rounter.dart';
import 'package:appologiq/home_screen.dart';
import 'package:appologiq/palette.dart';
import 'package:flutter/material.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator FrontScreen - GROUP

    void onPressed() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomRouter()));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background.png'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              width: double.maxFinite,
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Continue as guest",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontFamily: 'Barlow', fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  // width: double.maxFinite,
                  width: 32,
                ),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Let's do\nsomething!!",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontFamily: 'Barlow', fontWeight: FontWeight.w700, fontSize: 44, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "We are all about finding what’s out there, planing accordingly, & enjoying our time.",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontFamily: 'Barlow', fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
              child: SizedBox(
                height: 48,
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: onPressed,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Palette.themeColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                    child: Text(
                      "Sign in",
                      style: Palette.buttonTextStyle.copyWith(color: Colors.white),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
              child: SizedBox(
                height: 48,
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: onPressed,
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
                    child: Text(
                      "Sign Up",
                      style: Palette.buttonTextStyle.copyWith(color: Colors.black),
                    )),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
          ],
        ),
      ),
    );
  }
}
