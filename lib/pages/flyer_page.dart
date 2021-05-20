import 'package:bee_coffee/models/cup_model.dart';
import 'package:bee_coffee/my_data_prov.dart';
import 'package:bee_coffee/thems/default_custom_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';
import 'package:bee_coffee/pages/cup_gift_page.dart';

class FlyerPage extends StatefulWidget {

  static const String routeName = "/flyers";
  final String phoneNumber;

  FlyerPage({@required this.phoneNumber});

  @override
  _FlyerPageState createState() => _FlyerPageState();
}

class _FlyerPageState extends State<FlyerPage> {
  Widget _getCup(String cupType, int id) {
    Map<String, IconData> mapType = {
      'empty': Icons.free_breakfast_outlined,
      'full': Icons.free_breakfast_rounded,
      'gift': Icons.free_breakfast_sharp
    };

    if(cupType == 'gift') {
      return Hero(
        tag: id,
        child: Icon(
          mapType[cupType],
          color: cupType == 'gift'
              ? DefaultCustomTheme.kGiftCapColor
              : DefaultCustomTheme.kLogoColor,
          size: Size.fromRadius(85).width,
          key: ValueKey(id),
        ),
      );
    }

    return Icon(
      mapType[cupType],
      color: cupType == 'gift'
          ? DefaultCustomTheme.kGiftCapColor
          : DefaultCustomTheme.kLogoColor,
      size: Size.fromRadius(85).width,
      key: ValueKey(id),
    );

    // return SizedBox.fromSize(
    //   size: Size.fromRadius(90),
    //   child: FittedBox(child: Icon(
    //     mapType[cupType],
    //     color: cupType == 'gift'
    //         ? DefaultCustomTheme.kGiftCapColor
    //         : DefaultCustomTheme.kLogoColor,
    //     // size: 130,
    //     // size: double.infinity,
    //     key: ValueKey(id),
    //     // key: UniqueKey(),
    //   ),
    //   ),
    // );
  }

  Widget _makeFlyers(int index, List<List<CupModel>> cupList) {
    List<Widget> makeCupList = cupList[index].map((cup) {
      return AnimeCup(
          cup: _getCup(cup.typeCup, cup.id),
          cupStatus: cup.status,
          typeCup: cup.typeCup,
          phoneNumber: widget.phoneNumber,
          key: UniqueKey());
    }).toList();

    return Flyer(
        cupList: makeCupList,
        enterCode: index == 0 ? EnterCode() : null
    );
  }

  List<List<CupModel>> cupList;

  // _updateCupList(BuildContext context) async {
  _updateCupList() async {
     cupList = await MyDataProv().getData();
      setState(() {});
  }

  @override
  void initState() {
    _updateCupList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // _updateCupList(context);

    // Future<List<List<CupModel>>> cupListF = context.watch<MyDataProv>().getData.then((value) => value);
   // List<List<CupModel>> cupList;
   // context.watch<MyDataProv>().getData.then((value) {
   //   cupList = value;
   // });

    // print(phoneNumber);

    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   context.read<MyDataProv>().changeData("OK");
      // }),
      body: SafeArea(
        child: Container(
          color: DefaultCustomTheme.kWelcomePageBackground,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: cupList == null  ? CircularProgressIndicator() : ListView.builder(
            // itemCount: cupList.length,
            itemCount: cupList == null ? 0 : cupList.length,
            itemBuilder: (context, index) {
              return _makeFlyers(index, cupList);
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
  final String phoneNumber;
  final String typeCup;

  AnimeCup({this.cup, key, this.cupStatus,this.typeCup, this.phoneNumber}) : super(key: key);

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

    // Future.delayed(Duration(milliseconds: 1000), () {
    //   _controller.forward(from: 0.0);
    // });

    _controller.forward(from: 0.0);

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

  Widget _animeNotAnime(Widget cup, String status) {
    // 'start', 'change'
    if (status == "static") {
      return cup;
    }

    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext _, child) {
          return widget.cupStatus == 'start'
              ? _transformScale(child, _controller)
              : _transformRotate(child, _controller);
        },
        child:  cup);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          if(widget.typeCup == 'gift') {
            Navigator.pushNamed(context, CupGiftPage.routeName,arguments: widget.phoneNumber);

            // Navigator.push(context,MaterialPageRoute(builder: (context)=>CupGiftPage(phoneNumber:widget.phoneNumber),),);
          }
          // setState(() {
            // _controller.forward(from: 0.0);
          // });
        },
        child: _animeNotAnime(widget.cup, widget.cupStatus));
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
          runSpacing: 1,
          alignment: WrapAlignment.spaceAround,
          // alignment: WrapAlignment.spaceBetween,
          // alignment: WrapAlignment.spaceEvenly,
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
              autofocus: true,
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
