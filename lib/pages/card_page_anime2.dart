import 'package:bee_coffee/color_bloc.dart';
import 'package:bee_coffee/thems/default_custom_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
// import 'package:flutter/animation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

List<MakeCup> makeCupList = [
  MakeCup(type: CupType.full, key: ValueKey(1)),
  MakeCup(type: CupType.empty, key: ValueKey(2)),
  // MakeCup(type: CupType.empty, key: ValueKey(3)),
  // MakeCup(type: CupType.empty, key: ValueKey(4)),
  // MakeCup(type: CupType.empty, key: ValueKey(5)),
  // MakeCup(type: CupType.gift, key: ValueKey(6)),
];

List<AnimationController> makeCupAnimeList = [];
List<Function> makeCupAnimeFunctionList = [];

// List<GlobalKey> myGlobalKeyList = [];

class CardPageAnime2 extends StatefulWidget {
  @override
  _CardPageAnime2State createState() => _CardPageAnime2State();
}

class _CardPageAnime2State extends State<CardPageAnime2> {
  @override
  Widget build(BuildContext context) {
    // ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // print(makeCupList[1].hashCode);
        // makeCupAnimeList[0].forward(from: 0);
        // makeCupAnimeList[1].forward(from: 0);

        makeCupAnimeFunctionList[0].call();

        print("FloatingActionButton 2");
      }),
      body: SafeArea(
        child: Container(
          color: DefaultCustomTheme.kWelcomePageBackground,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              // MakeCup(type: CupType.full, key: ValueKey(1)),
              // MakeCup(type: CupType.empty, key: ValueKey(2)),
              ...makeCupList.map<AnimeCup>((cup) {
                return AnimeCup(cup: cup, key: UniqueKey());
              }),
            ],
          ),
        ),
      ),
    );
  }
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
    // Tween<double> _scaleTween = Tween<double>(begin: 0, end: 1);
    //
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
  final Function onTap;

  AnimeCup({this.cup, this.onTap, key}) : super(key: key);

  @override
  _AnimeCupState createState() => _AnimeCupState();
}

class _AnimeCupState extends State<AnimeCup>
    with SingleTickerProviderStateMixin {
  // var squareScale = 0.0;
  final GlobalKey<_AnimeCupState> listKey = GlobalKey<_AnimeCupState>();

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

    // _counterState = GlobalKey();

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

    Function getF() {
      setState(() {
        _controller.forward(from: 0.0);
      });
    }

    makeCupAnimeFunctionList.add(getF);

    return InkWell(
      onTap: () {
        setState(() {
          _controller.forward(from: 0.0);
        });
      },
      child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext _, child) {
            return Transform.rotate(
              angle: -math.pi / 3.14 + _controller.value,
              child: Transform.scale(
                scale: _controller.value,
                child: child,
              ),
            );
          },
          child: widget.cup),
    );
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

enum CupType {
  empty,
  full,
  gift,
}
