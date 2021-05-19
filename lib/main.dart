import 'package:bee_coffee/color_bloc.dart';
import 'package:bee_coffee/my_data_prov.dart';
import 'package:bee_coffee/pages/card_page_anime.dart';
import 'package:bee_coffee/pages/card_page.dart';
import 'package:bee_coffee/pages/card_page_bloc.dart';
import 'package:bee_coffee/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
    // CardPageAnime(),
  );
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.dark(),
//       home: CardPageAnime(),
//       // home: WelcomePage(),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData.dark(),
//       // home: BlocProvider(
//       //   create: (context) => ColorBloc(Colors.red),
//       //   child: CardPageBloc(),
//       // )
//
//       // home: CardPageAnime(),
//       home: WelcomePage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyDataProv()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bee Coffee Demo',
        theme: ThemeData.dark(),
        // home: CardPageAnime4(),
        home: WelcomePage(),
      ),
    );

    // return ChangeNotifierProvider<MyDataProv>(
    //   create: (context) => MyDataProv(),
    //   child: MaterialApp(
    //     title: 'Bee Coffee Demo',
    //     theme: ThemeData.dark(),
    //     home: CardPageAnime4(),
    //     // home: WelcomePage(),
    //   ),
    // );
  }
}
