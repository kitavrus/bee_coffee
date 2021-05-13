import 'package:bee_coffee/color_bloc.dart';
import 'package:bee_coffee/thems/default_custom_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/animation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

List<MakeCup> makeCupList = [
  MakeCup(type: CupType.full, key: ValueKey(1)),
  MakeCup(type: CupType.empty, key: ValueKey(2)),
  MakeCup(type: CupType.gift, key: ValueKey(6)),
];

List<AnimationController> makeCupAnimeList = [];
List<Function> makeCupAnimeFunctionList = [];

class CardPageBloc extends StatefulWidget {
  @override
  _CardPageBlocState createState() => _CardPageBlocState();
}

class _CardPageBlocState extends State<CardPageBloc> {
  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // makeCupAnimeFunctionList[0](Colors.red);
        // makeCupAnimeFunctionList[0].call();

        _bloc.add(ColorEvent.event_green);

        print("FloatingActionButton");
      }),
      body: SafeArea(
        child: Container(
          color: DefaultCustomTheme.kWelcomePageBackground,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              ...makeCupList.map<AnimeCup>((cup) {
                return AnimeCup(
                  cup: cup,
                  key: UniqueKey(),
                );
              }),
            ],
          ),
        ),
      ),
    );
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
  AnimationController _controller;

  Color _color; // = Colors.red;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(milliseconds: 800));

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

  Transform _transformScale(Widget child, AnimationController controller) {
    return Transform.scale(
      scale: controller.value,
      child: child,
    );
  }

  Transform _transformRotate(Widget child, AnimationController controller) {
    return Transform.rotate(
      angle: -math.pi / 3.14 + controller.value,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    void getF(Color color) {
      setState(() {
        _color = color;
        _controller.forward(from: 0.0);
      });
    }

    // makeCupAnimeFunctionList.add(getF);

    return InkWell(
      onTap: () {
        setState(() {
          _controller.forward(from: 0.0);
        });
      },
      child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext _, child) {
            return _color == Colors.red
                ? _transformScale(child, _controller)
                : _transformRotate(child, _controller);
          },
          child: widget.cup),
    );

    // return BlocBuilder(
    //   builder: (context, currentColor) => InkWell(
    //     onTap: () {
    //       setState(() {
    //         _controller.forward(from: 0.0);
    //       });
    //     },
    //     child: AnimatedBuilder(
    //         animation: _controller,
    //         builder: (BuildContext _, child) {
    //           return _color == Colors.red
    //               ? _transformScale(child, _controller)
    //               : _transformRotate(child, _controller);
    //         },
    //         child: widget.cup),
    //   ),
    // );

    // return InkWell(
    //   onTap: () {
    //     setState(() {
    //       _controller.forward(from: 0.0);
    //     });
    //   },
    //   child: AnimatedBuilder(
    //       animation: _controller,
    //       builder: (BuildContext _, child) {
    //         return Transform.rotate(
    //           angle: -math.pi / 3.14 + _controller.value,
    //           child: Transform.scale(
    //             scale: _controller.value,
    //             child: child,
    //           ),
    //         );
    //       },
    //       child: widget.cup),
    // );
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
// class MakeCup extends StatelessWidget {
//   final CupType type;
//
//   MakeCup({
//     this.type,
//     key,
//   }) : super(key: key);

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
