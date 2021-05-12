import 'package:bee_coffee/thems/default_custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

List<MakeCup> makeCupList = [
  MakeCup(type: CupType.full, key: ValueKey(1)),
  MakeCup(type: CupType.empty, key: ValueKey(2)),
  MakeCup(type: CupType.empty, key: ValueKey(3)),
  MakeCup(type: CupType.empty, key: ValueKey(4)),
  MakeCup(type: CupType.empty, key: ValueKey(5)),
  MakeCup(type: CupType.gift, key: ValueKey(6)),
];

List<AnimationController> makeCupAnimeList = [];

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final key = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // print(makeCupList[1].hashCode);
        makeCupAnimeList[0].forward(from: 0);
        // makeCupAnimeList[1].forward(from: 0);
        print("FloatingActionButton");

        // Tween<double> _scaleTween = Tween<double>(begin: 0, end: 1);
        // TweenAnimationBuilder(
        //     tween: _scaleTween,
        //     duration: Duration(milliseconds: 800),
        //     builder: (context, scale, child) {
        //       return Transform.scale(
        //         scale: scale,
        //         child: child,
        //       );
        //     },
        //     child: makeCupList[1]);

        print("FloatingActionButton");
      }),
      body: SafeArea(
        child: Container(
          color: DefaultCustomTheme.kWelcomePageBackground,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Flyer(enterCode: EnterCode()),
              // Flyer(),
              // Flyer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Flyer extends StatelessWidget {
  final Widget enterCode;

  Flyer({
    this.enterCode,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: EdgeInsets.all(0),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 1,
          alignment: WrapAlignment.center,
          children: [
            ...makeCupList.map<AnimeCup>((cup) {
              print(cup.hashCode);
              return AnimeCup(cup: cup, key: UniqueKey());
            }),
            // enterCode ?? SizedBox(height: 0, width: 0)
          ],
        ),
      ),
    );
  }
}

enum CupType {
  empty,
  full,
  gift,
}

class MakeCup extends StatefulWidget {
  final CupType type;

  MakeCup({
    this.type,
    key,
  }) : super(key: key);

  @override
  _MakeCupState createState() => _MakeCupState();
}

class _MakeCupState extends State<MakeCup> {
  final double _iconSize = 180;

  @override
  Widget build(BuildContext context) {
    Widget _getEmptyCup() {
      return Icon(
        Icons.free_breakfast_outlined,
        color: DefaultCustomTheme.kLogoColor,
        size: _iconSize,
        key: UniqueKey(),
      );
    }

    Widget _getFullCup() {
      return Icon(
        Icons.free_breakfast_rounded,
        color: DefaultCustomTheme.kLogoColor,
        size: _iconSize,
        key: UniqueKey(),
      );
    }

    Widget _getGiftCup() {
      return Icon(
        Icons.free_breakfast_sharp,
        color: DefaultCustomTheme.kLogoColor,
        size: _iconSize,
        key: UniqueKey(),
      );
    }

    Widget cup;

    switch (widget.type) {
      case CupType.empty:
        cup = _getEmptyCup();
        break;
      case CupType.full:
        cup = _getFullCup();
        break;
      case CupType.gift:
        cup = _getGiftCup();
        break;
      default:
        cup = _getEmptyCup();
    }
    return cup;

    // return TweenAnimationBuilder(
    //     tween: _scaleTween,
    //     duration: Duration(milliseconds: 800),
    //     builder: (context, scale, child) {
    //       return Transform.scale(
    //         scale: scale,
    //         child: child,
    //       );
    //     },
    //     child: cup);
  }
}

class AnimeCup extends StatefulWidget {
  final Widget cup;

  AnimeCup({this.cup, key}) : super(key: key);

  @override
  _AnimeCupState createState() => _AnimeCupState();
}

class _AnimeCupState extends State<AnimeCup>
    with SingleTickerProviderStateMixin {
  // var squareScale = 0.0;

  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(milliseconds: 800));
    // _controller.addListener(() {
    //   // setState(() {
    //   //   squareScale = _controller.value;
    //   // });
    // });

    Future.delayed(Duration(milliseconds: 2000), () {
      _controller.forward(from: 0.0);
    });

    makeCupAnimeList.add(_controller);

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();

  @override
  Widget build(BuildContext context) {
    // return Transform.scale(
    //   scale: squareScale,
    //   child: widget.cup,
    // );
    //

    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext _, child) {
          return Transform.scale(
            scale: _controller.value,
            child: child,
          );
        },
        child: widget.cup);
  }

  // Tween<double> _scaleTween = Tween<double>(begin: 0, end: 1);
  // return TweenAnimationBuilder(
  //       tween: _scaleTween,
  //       duration: Duration(milliseconds: 800),
  //       builder: (context, scale, child) {
  //         return Transform.scale(
  //           scale: scale,
  //           child: child,
  //         );
  //       },
  //       child: widget.cup);
  // }

}

class EnterCode extends StatelessWidget {
  // const EnterCode({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Column(children: [
      Text(
        "Введите код",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      SizedBox(height: 25),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 35,
            child: TextField(
              maxLength: 1,
              // autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(5),
                counterText: '',
              ),
              onChanged: (value) {
                node.nextFocus();
              },
            ),
          ),
          Container(
            width: 35,
            child: TextField(
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(5),
                counterText: '',
              ),
              onChanged: (value) {
                node.nextFocus();
              },
            ),
          ),
          Container(
            width: 35,
            child: TextField(
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(5),
                counterText: '',
              ),
              onChanged: (value) {
                node.nextFocus();
              },
            ),
          ),
          Container(
            width: 35,
            child: TextField(
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(5),
                counterText: '',
              ),
              onChanged: (value) {
                final snackBar = SnackBar(
                  content: Text(
                    'Чашка успешно засчитана!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  action: SnackBarAction(
                    label: '',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );

                // Find the ScaffoldMessenger in the widget tree
                // and use it to show a SnackBar.
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ),
        ],
      ),
      SizedBox(height: 25),
    ]);
  }
}
