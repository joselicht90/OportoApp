import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oporto_almacen/calendario/calendario.dart';
import 'package:oporto_almacen/carta/carta.dart';
import 'package:oporto_almacen/home_page/home_page.dart';
import 'package:oporto_almacen/oporto/info_oporto.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalWidgetsLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es'),
        const Locale('en'),
        //const Locale.fromSubtags(languageCode: 'es', countryCode: 'AR'),
      ],
      builder: (context, child) {
        double x = MediaQuery.of(context).size.width *
            MediaQuery.of(context).devicePixelRatio;
        return MediaQuery(
          child: child,
          data: x > 1440 && x != 0
              ? MediaQuery.of(context).copyWith(textScaleFactor: 0.7)
              : MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/oporto': (context) => InfoOporto(),
        '/carta': (context) => Carta(),
        '/calendario': (context) => Calendario(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
          canvasColor: Colors.white,
          accentColor: Color(0xFFf05b40),
          highlightColor: Color(0xFFfff5f1)),
      //home: HomePage(),
    );
  }
}
