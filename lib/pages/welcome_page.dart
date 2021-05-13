import 'package:bee_coffee/pages/card_page.dart';
import 'package:bee_coffee/pages/card_page_anime2.dart';
import 'package:bee_coffee/pages/card_page_anime3.dart';
import 'package:bee_coffee/thems/default_custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: DefaultCustomTheme.kWelcomePageBackground,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bee Coffee',
                style: TextStyle(
                  fontSize: 30,
                  color: DefaultCustomTheme.kLogoColor,
                  fontFamily: 'Oi',
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Каждая шестая чашка кофе в подарок',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color: Color(0xFFF6B256),
                  // fontFamily: 'Oi',
                ),
              ),
              SizedBox(height: 80),
              // OutlinedButton(
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      DefaultCustomTheme.kGiftCapColor),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      // return CardPageBloc();
                      return CardPageAnime3();
                      // return CardPageAnime2();
                      // return CardPageAnime();
                      // return CardPage();
                    }),
                  );
                },
                child: Text(
                  "Принять участие",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
