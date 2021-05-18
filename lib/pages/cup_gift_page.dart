import 'package:bee_coffee/thems/default_custom_theme.dart';
import 'package:flutter/material.dart';

class CupGiftPage extends StatelessWidget {
  // const CupGiftPage({Key key}) : super(key: key);
  // final int cupIndex;

  // CupGiftPage.name({this.cupIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 6,
          child: Icon(
            Icons.free_breakfast_sharp,
            color:DefaultCustomTheme.kGiftCapColor,
            size: Size.fromRadius(200).width,
            key: ValueKey(6),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                DefaultCustomTheme.kGiftCapColor),
          ),
          onPressed: () {

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
          child: Text(
            "Получить подарочную чашку",
          ),
        ),
      ],
    );
  }
}
