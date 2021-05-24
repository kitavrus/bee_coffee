import 'package:bee_coffee/color_bloc.dart';
import 'package:bee_coffee/my_data_prov.dart';
import 'package:bee_coffee/pages/flyer_page.dart';
import 'package:bee_coffee/pages/cup_gift_page.dart';
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => MyDataProv()..startLoad()),
        ChangeNotifierProvider(create: (_) => MyDataProv()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bee Coffee Demo',
        theme: ThemeData.dark(),
        initialRoute: WelcomePage.routeName,
        routes: {
          WelcomePage.routeName : (context)=>WelcomePage(),
          FlyerPage.routeName : (context) {
              final phoneNumber = ModalRoute.of(context)?.settings?.arguments as String;
              return FlyerPage(phoneNumber: phoneNumber);
            },
          CupGiftPage.routeName : (context) {
              final phoneNumber = ModalRoute.of(context)?.settings?.arguments as String;
              return CupGiftPage(phoneNumber: phoneNumber);
            },
        },
      ),
    );
  }
}
