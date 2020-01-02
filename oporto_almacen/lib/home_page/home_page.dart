import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:oporto_almacen/generics/CustomDrawer.dart';
import 'package:oporto_almacen/helpers/ui_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oporto_almacen/generics/BackgroundContainer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Stack(
      children: <Widget>[
        BackgroundContainer(),
        Container(
          width: UiHelper.getWidth(context),
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image(
              image: AssetImage('assets/images/home_image.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: CustomDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) {
                return Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Color(0x50FFFFFF), shape: BoxShape.circle),
                  child: IconButton(
                    icon: Image.asset(
                      'assets/icons/menu_icon.png',
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                );
              },
            ),
            title: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(color: Color(0x50FFFFFF)),
              height: AppBar().preferredSize.height,
              child: Image.asset(
                'assets/icons/oporto_logo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            centerTitle: true,
          ),
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 800),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: [
                        Container(
                          width: UiHelper.getWidth(context),
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).highlightColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '26 de Septiembre - 19:00 hs',
                                style: GoogleFonts.comfortaa(
                                  textStyle: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          UiHelper.getWidth(context) / 40),
                                ),
                              ),
                              Text(
                                'Degustación Pinot Noir Argentinos',
                                style: GoogleFonts.comfortaa(
                                  textStyle: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontSize:
                                          UiHelper.getWidth(context) / 40),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'RECOMENDACIONES',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w900,
                                  fontSize: UiHelper.getWidth(context) / 40),
                            ),
                          ),
                        ),
                        CarouselSlider(
                          initialPage: 0,
                          viewportFraction: 0.7,
                          enableInfiniteScroll: false,
                          height: UiHelper.getOrientation(context) ==
                                  Orientation.portrait
                              ? UiHelper.getHeight(context) / 3
                              : UiHelper.getWidth(context) / 3,
                          enlargeCenterPage: true,
                          items: <Widget>[
                            HomePageCard(
                              image: AssetImage(
                                  'assets/images/entradas_image.jpg'),
                              title: 'Lorem ipsum dolor sit amet',
                              tag: 'imagen_entradas',
                            ),
                            HomePageCard(
                              image: AssetImage(
                                  'assets/images/cocktails_image.jpg'),
                              title: 'Lorem ipsum dolor sit amet',
                              tag: 'imagen_raciones',
                            ),
                            HomePageCard(
                              image: AssetImage(
                                  'assets/images/almuerzo_image.jpg'),
                              title: 'Lorem ipsum dolor sit amet',
                              tag: 'imagen_platos_principales',
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${DateTime.now().day.toString()} de ${DateFormat.MMMM('es').format(DateTime.now())}',
                              style: GoogleFonts.comfortaa(
                                  textStyle: TextStyle(color: Colors.grey),
                                  fontSize: UiHelper.getWidth(context) / 40),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'PLATO DEL DÍA',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w900,
                                  fontSize: UiHelper.getWidth(context) / 40),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PlatoDelDia(),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class PlatoDelDia extends StatelessWidget {
  const PlatoDelDia({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: UiHelper.getOrientation(context) == Orientation.portrait
              ? UiHelper.getHeight(context) / 3
              : UiHelper.getWidth(context) / 3,
          width: UiHelper.getWidth(context),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/plato_del_dia.jpg'),
                fit: BoxFit.cover),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 5.0,
                  spreadRadius: 0.5,
                  offset: Offset(0.0, 5)),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: UiHelper.getOrientation(context) == Orientation.portrait
              ? UiHelper.getHeight(context) / 3
              : UiHelper.getWidth(context) / 3,
          width: UiHelper.getWidth(context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                  stops: [0.1, 0.9],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.white, Colors.transparent])),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: UiHelper.getOrientation(context) == Orientation.portrait
              ? UiHelper.getHeight(context) / 3
              : UiHelper.getWidth(context) / 3,
          width: UiHelper.getWidth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'Lorem Impsum',
                style: GoogleFonts.comfortaa(
                    fontSize: UiHelper.getWidth(context) / 40),
              ),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus euismod fermentum neque at varius. Sed nec ex at est ultricies.',
                  style: GoogleFonts.comfortaa(
                      fontSize: UiHelper.getWidth(context) / 40)),
            ],
          ),
        )
      ],
    );
  }
}

class HomePageCard extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String tag;
  const HomePageCard({
    this.image,
    this.title,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      key: Key(tag),
      tag: tag,
      child: GestureDetector(
        // onTap: () => Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => ListadoPlatos(
        //       heroImage: image,
        //       heroTag: tag,
        //       title: title,
        //     ),
        //   ),
        // ),
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 50),
              width: UiHelper.getWidth(context) / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(image: image, fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 5.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.0, 5)),
                ],
              ),
              // child: Align(
              //     alignment: Alignment.bottomLeft,
              //     child: Text(title,
              //         style: GoogleFonts.comfortaa(
              //             fontSize: 30,
              //             textStyle: TextStyle(color: Color(0xFFf05b40))))),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 50),
              //height: 300,
              width: UiHelper.getWidth(context) / 1.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      stops: [0.1, 0.9],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.white, Colors.transparent])),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 50),
              //height: 300,
              width: UiHelper.getWidth(context) / 1.5,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  style: GoogleFonts.comfortaa(
                      fontSize: UiHelper.getWidth(context) / 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
