import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oporto_almacen/helpers/ui_helper.dart';
import 'package:oporto_almacen/helpers/url_launcher_helper.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (UiHelper.getOrientation(context) == Orientation.portrait) {
      return SizedBox(
        width: UiHelper.getWidth(context) * 0.653,
        child: Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    child: Image.asset(
                      'assets/icons/oporto_logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      UrlLauncheHelper.launchURLInstagram(
                          'instagram://user?username=oportoalmacen',
                          'https://www.instagram.com/oportoalmacen/');
                    },
                    icon:
                        Image.asset('assets/icons/instagram_material_icon.png'),
                  ),
                  IconButton(
                    onPressed: () {
                      //NO ES LO MISMO ANDROID QUE IOS, CHEQUEAR
                      UrlLauncheHelper.launchURLFacebook(
                          'fb://page/471849019580569',
                          'https://www.facebook.com/oportoalmacen');
                    },
                    icon:
                        Image.asset('assets/icons/facebook_material_icon.png'),
                  ),
                  IconButton(
                    onPressed: () {
                      UrlLauncheHelper.launchURLTwitter(
                          'twitter://user?user_id=1947978644',
                          'https://twitter.com/oportoalmacen');
                    },
                    icon: Image.asset('assets/icons/twitter_material_icon.png'),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    DrawerItem(
                      title: '- HOME -',
                      route: '/',
                    ),
                    DrawerItem(
                      title: '- OPORTO -',
                      route: '/oporto',
                    ),
                    DrawerItem(
                      title: '- CARTA -',
                      route: '/carta',
                    ),
                    DrawerItem(
                      title: '- CALENDARIO -',
                      route: '/calendario',
                    ),
                    DrawerItem(
                      title: '- PRENSA -',
                      route: '/oporto',
                    ),
                    DrawerItem(
                      title: '- GIFT CARD -',
                      route: '/giftcard',
                    ),
                    DrawerItem(
                      title: '- RESERVA -',
                      route: '/oporto',
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              UrlLauncheHelper.launchURLMaps(
                                'https://www.google.com.ar/maps/place/Oporto+Almac%C3%A9n/@-34.5414735,-58.4666936,17z/data=!3m1!4b1!4m5!3m4!1s0x95bcb69f8aa9f5f7:0xc3822928c95d204b!8m2!3d-34.541527!4d-58.464557',
                              );
                            },
                            icon: Image.asset(
                                'assets/icons/maps_material_icon.png'),
                          ),
                          IconButton(
                            onPressed: () {
                              //NO ES LO MISMO ANDROID QUE IOS, CHEQUEAR
                              UrlLauncheHelper.launchPhoneCall(
                                  'tel:+541147017434');
                            },
                            icon: Image.asset(
                                'assets/icons/phone_material_icon.png'),
                          ),
                        ],
                      ),
                      Text(
                        'LUNES A SÁBADO DE 10:00 A 00 HS.',
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w900,
                            fontSize: UiHelper.getWidth(context) / 50),
                      ),
                      Text(
                        'DOMINGOS DE 10:00 A 16:00 HS.',
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.w900,
                            fontSize: UiHelper.getWidth(context) / 50),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return SizedBox(
        width: UiHelper.getWidth(context) * 0.80,
        child: Drawer(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SafeArea(
                      child: Container(
                        width: UiHelper.getWidth(context) * 0.2,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 30),
                        child: Image.asset(
                          'assets/icons/oporto_logo.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            UrlLauncheHelper.launchURLInstagram(
                                'instagram://user?username=oportoalmacen',
                                'https://www.instagram.com/oportoalmacen/');
                          },
                          icon: Image.asset(
                              'assets/icons/instagram_material_icon.png'),
                        ),
                        IconButton(
                          onPressed: () {
                            //NO ES LO MISMO ANDROID QUE IOS, CHEQUEAR
                            UrlLauncheHelper.launchURLFacebook(
                                'fb://page/471849019580569',
                                'https://www.facebook.com/oportoalmacen');
                          },
                          icon: Image.asset(
                              'assets/icons/facebook_material_icon.png'),
                        ),
                        IconButton(
                          onPressed: () {
                            UrlLauncheHelper.launchURLTwitter(
                                'twitter://user?user_id=1947978644',
                                'https://twitter.com/oportoalmacen');
                          },
                          icon: Image.asset(
                              'assets/icons/twitter_material_icon.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DrawerItem(
                      title: '- HOME -',
                      route: '/',
                    ),
                    DrawerItem(
                      title: '- OPORTO -',
                      route: '/oporto',
                    ),
                    DrawerItem(
                      title: '- CARTA -',
                      route: '/carta',
                    ),
                    DrawerItem(
                      title: '- CALENDARIO -',
                      route: '/calendario',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DrawerItem(
                      title: '- PRENSA -',
                      route: '/oporto',
                    ),
                    DrawerItem(
                      title: '- GIFT CARD -',
                      route: '/giftcard',
                    ),
                    DrawerItem(
                      title: '- RESERVA -',
                      route: '/oporto',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class DrawerItem extends StatelessWidget {
  @required
  final String title;
  @required
  final String route;

  const DrawerItem({
    this.route,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(route);
      },
      title: Center(
        child: Text(
          title,
          style: GoogleFonts.comfortaa(
              fontWeight: FontWeight.w900,
              fontSize: UiHelper.getWidth(context) / 40),
        ),
      ),
    );
  }
}
