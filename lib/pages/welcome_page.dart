import 'package:bee_coffee/pages/flyer_page.dart';
import 'package:bee_coffee/thems/default_custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatelessWidget {

  static const String routeName = "/welcome_page";

  final TextEditingController _textEditingController = TextEditingController(text: '9991122');

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
                ),
              ),
              SizedBox(height: 80),
              Container(
                width:250,
                child: TextField(
                  controller: _textEditingController,
                  maxLength: 10,
                  autofocus: true,
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefix: Text("+7 "),
                    // labelText: "Номер телефона",
                    hintText: "Введите номер телефона",
                    border: OutlineInputBorder(),
                    contentPadding: const EdgeInsets.all(5),
                    counterText: '',
                  ),
                   // inputFormatters:[ PhoneNumberTextInputFormatter()],
                  onChanged: (value) {},
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      DefaultCustomTheme.kGiftCapColor),
                ),
                onPressed: () {
                  
                  Navigator.pushReplacementNamed(context,FlyerPage.routeName,arguments: _textEditingController.text);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) {
                  //     return CardPage(phoneNumber:_textEditingController.text);
                  //   }),
                  // );
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


// class PhoneNumberTextInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final newTextLength = newValue.text.length;
//     int selectionIndex = newValue.selection.end;
//     int usedSubstringIndex = 1;
//     final newTextBuffer = StringBuffer();
//
//     if (newTextLength >= 1) {
//       if (newValue.text.startsWith(RegExp(r'[789]'))) {
//         newTextBuffer.write('+7');
//         if (newValue.text.startsWith('9')) {
//           newTextBuffer.write('(9');
//           selectionIndex = 4;
//         }
//         if (newValue.selection.end >= 1) selectionIndex++;
//       }
//     }
//
//     if (newTextLength >= 2) {
//       newTextBuffer
//           .write('(' + newValue.text.substring(1, usedSubstringIndex = 2));
//       if (newValue.selection.end >= 2) selectionIndex++;
//     }
//     if (newTextLength >= 5) {
//       newTextBuffer.write(
//           newValue.text.substring(usedSubstringIndex, usedSubstringIndex = 4) +
//               ')');
//       if (newValue.selection.end >= 4) selectionIndex++;
//     }
//     if (newTextLength >= 8) {
//       newTextBuffer.write(
//           newValue.text.substring(usedSubstringIndex, usedSubstringIndex = 7) +
//               '-');
//       if (newValue.selection.end >= 7) selectionIndex++;
//     }
//     if (newTextLength >= 10) {
//       newTextBuffer.write(
//           newValue.text.substring(usedSubstringIndex, usedSubstringIndex = 9) +
//               '-');
//       if (newValue.selection.end >= 9) selectionIndex++;
//     }
//
// // Dump the rest.
//     if (newTextLength > usedSubstringIndex) newTextBuffer.write(newValue.text.substring(usedSubstringIndex, newTextLength));
//
//     return TextEditingValue(
//       text: newTextBuffer.toString(),
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//
//
//   }
//
// }

// class PhoneNumberTextInputFormatter extends TextInputFormatter {
// @override
// TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue, TextEditingValue newValue) {
//   final int newTextLength = newValue.text.length;
//   int selectionIndex = newValue.selection.end;
//   int usedSubstringIndex = 0;
//   final StringBuffer newText = new StringBuffer();
//   if (newTextLength >= 4) {
//     newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + '-');
//     if (newValue.selection.end >= 3)
//       selectionIndex += 2;
//   }
//   if (newTextLength >= 7) {
//     newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
//     if (newValue.selection.end >= 6)
//       selectionIndex++;
//   }
//   if (newTextLength >= 11) {
//     newText.write(newValue.text.substring(6, usedSubstringIndex = 10) );
//     if (newValue.selection.end >= 10)
//       selectionIndex++;
//   }
//   if (newTextLength >= usedSubstringIndex)
//     newText.write(newValue.text.substring(usedSubstringIndex));
//   return new TextEditingValue(
//     text: newText.toString(),
//     selection: new TextSelection.collapsed(offset: newText.length),
//   );
// }
// }