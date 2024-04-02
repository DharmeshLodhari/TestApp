import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/CountryList.dart';
import 'package:test_app/providers/UserQuizzDataProvider.dart';
import 'package:test_app/screens/QuizzStartScreen.dart';
import 'package:test_app/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountryProvider>(
            create: (_) => CountryProvider()..fetchCountries()),
        ChangeNotifierProvider<UserQuizzDataProvider>(
            create: (_) => UserQuizzDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) =>  QuizzStartScreen(),
        },
      ),
    );
  }
}
