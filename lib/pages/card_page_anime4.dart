import 'package:bee_coffee/models/cup_model.dart';
import 'package:bee_coffee/my_data_prov.dart';
import 'package:bee_coffee/repository/cup_repository.dart';
import 'package:bee_coffee/thems/default_custom_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';

class CardPageAnime4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List<List<CupModel>> cupList = context.watch<MyDataProv>().getData();
    List<List<CupModel>> cupList = context.watch<MyDataProv>().getData;
    // MyDataProv data = context.watch<MyDataProv>().getData;
    // MyDataProv data = context.watch<MyDataProv>();
    // List<List<CupModel>> cupList = data.getData;

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // setState(() {
        //   _updateListView();
        // });

        context.read<MyDataProv>().changeData("OK");
      }),
      body: SafeArea(
        child: Container(
          color: DefaultCustomTheme.kWelcomePageBackground,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            // itemCount: makeCupList.length,
            itemCount: cupList.length,
            itemBuilder: (context, index) {
              List<Widget> makeCupList = cupList[index].map((cup) {
                return AnimeCup(
                    cup: getCup(cup.typeCup, cup.id),
                    cupStatus: cup.status,
                    key: UniqueKey());
              }).toList();

              return Flyer(
                  cupList: makeCupList,
                  enterCode: index == 0 ? EnterCode() : null);
            },
          ),
        ),
      ),
    );
  }
}

class AnimeCup extends StatefulWidget {
  final Widget cup;
  final String cupStatus;

  AnimeCup({this.cup, key, this.cupStatus}) : super(key: key);

  @override
  _AnimeCupState createState() => _AnimeCupState();
}

class _AnimeCupState extends State<AnimeCup>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(milliseconds: 800));

    Future.delayed(Duration(milliseconds: 1000), () {
      _controller.forward(from: 0.0);
    });

    // makeCupAnimeList.add(_controller);

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void getF(int color) {
  //   setState(() {
  //     _controller.forward(from: 0.0);
  //   });
  // }

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
            return widget.cupStatus == 'start'
                ? _transformScale(child, _controller)
                : _transformRotate(child, _controller);
          },
          child: widget.cup),
    );
  }
}

class Flyer extends StatelessWidget {
  final Widget enterCode;
  final List<Widget> cupList;

  Flyer({
    this.cupList,
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
          // alignment: WrapAlignment.center,
          alignment: WrapAlignment.spaceAround,
          children: [
            ...cupList,
            enterCode ?? SizedBox(height: 0, width: double.infinity),
          ],
        ),
      ),
    );
  }
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
                context.read<MyDataProv>().changeData(value.toString());

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

Widget getCup(String cupType, int id) {
  Map<String, IconData> mapType = {
    'empty': Icons.free_breakfast_outlined,
    'full': Icons.free_breakfast_rounded,
    'gift': Icons.free_breakfast_sharp
  };

  return Icon(
    mapType[cupType],
    color: DefaultCustomTheme.kLogoColor,
    size: 130,
    key: ValueKey(id),
    // key: UniqueKey(),
  );
}
