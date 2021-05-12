import 'package:bee_coffee/thems/default_custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPageAnime extends StatefulWidget {
  @override
  _CardPageAnimeState createState() => _CardPageAnimeState();
}

class _CardPageAnimeState extends State<CardPageAnime> {
  // double _width = 0;
  // double _height = 0;

  // void _updateState() {
  //   setState(() {
  //     _height = 130;
  //     _width = 130;
  //   });
  // }

  // @override
  // void initState() {
  //   // _updateState();
  //   // TODO: implement initState
  //   super.initState();
  // }

  Tween<double> _scaleTween = Tween<double>(begin: 1, end: 2);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // OutlinedButton(
              //   onPressed: () {
              //     // _updateState();
              //   },
              //   child: Text("Press"),
              // ),
              TweenAnimationBuilder(
                tween: _scaleTween,
                duration: Duration(milliseconds: 400),
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: child,
                  );
                },
                child: Icon(
                  Icons.free_breakfast_sharp,
                  color: DefaultCustomTheme.kLogoColor,
                  size: 130,
                ),
              ),
              // AnimatedContainer(
              //   duration: Duration(milliseconds: 1000),
              //   width: _width,
              //   height: _height,
              //   color: Colors.red,
              //   clipBehavior: Clip.hardEdge,
              //   child: Icon(
              //     Icons.free_breakfast_sharp,
              //     color: DefaultCustomTheme.kLogoColor,
              //     size: 130,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
