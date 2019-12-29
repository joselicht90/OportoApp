import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:oporto_almacen/helpers/ui_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oporto_almacen/generics/BackgroundContainer.dart';
import 'package:oporto_almacen/listados/lista_platos.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es-AR');
    return Stack(
      children: <Widget>[
        BackgroundContainer(),
        Container(
          width: UiHelper.getWidth(context),
          child: Image.asset(
            'assets/images/home_image.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Image.asset(
              'assets/icons/menu_icon.png',
              height: 50,
            ),
            title: Container(
              height: AppBar().preferredSize.height,
              child: Image.asset(
                'assets/icons/oporto_logo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: Container(
                //     height: UiHelper.getWidth(context) / 10,
                //     child: Image.asset('assets/icons/oporto_logo.png'),
                //   ),
                // ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        width: UiHelper.getWidth(context) / 1.2,
                        child: Text(
                          '"Oporto nace desde el entusiasmo de hacerlo simple, rico y agradable. Con la intención de reivindicar platos de nuestra infancia trabajamos sobre recetas originarias con productos frescos y de estación."',
                          style: GoogleFonts.montserrat(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            textStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
                      CarouselSlider(
                        initialPage: 3,
                        viewportFraction: 0.6,
                        enableInfiniteScroll: false,
                        height: UiHelper.getOrientation(context) ==
                                Orientation.portrait
                            ? UiHelper.getHeight(context) / 2
                            : UiHelper.getWidth(context) / 2,
                        enlargeCenterPage: true,
                        items: <Widget>[
                          HomePageCard(
                            image:
                                AssetImage('assets/images/entradas_image.jpg'),
                            title: 'Entradas',
                            tag: 'imagen_entradas',
                          ),
                          HomePageCard(
                            image:
                                AssetImage('assets/images/almuerzo_image.jpg'),
                            title: 'Raciones',
                            tag: 'imagen_raciones',
                          ),
                          HomePageCard(
                            image:
                                AssetImage('assets/images/almuerzo_image.jpg'),
                            title: 'Principales',
                            tag: 'imagen_platos_principales',
                          ),
                          HomePageCard(
                            image:
                                AssetImage('assets/images/cocktails_image.jpg'),
                            title: 'Especialidades',
                            tag: 'imagen_especialidades',
                          ),
                          HomePageCard(
                            image:
                                AssetImage('assets/images/almuerzo_image.jpg'),
                            title: 'Ensaladas',
                            tag: 'imagen_ensaladas',
                          ),
                          HomePageCard(
                            image:
                                AssetImage('assets/images/cocktails_image.jpg'),
                            title: 'Cocktelería',
                            tag: 'imagen_cockteles',
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              '${DateTime.now().day.toString()} de ${DateFormat.MMMM().format(DateTime.now())}',
                              style: GoogleFonts.comfortaa(
                                  textStyle: TextStyle(color: Colors.grey))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('PLATO DEL DÍA',
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.bold)),
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
                style: GoogleFonts.comfortaa(fontSize: 30),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus euismod fermentum neque at varius. Sed nec ex at est ultricies.',
                style: GoogleFonts.comfortaa(),
              ),
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
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ListadoPlatos(
                  heroImage: image,
                  heroTag: tag,
                  title: title,
                ))),
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 50),
              width: UiHelper.getWidth(context) / 2,
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
              width: UiHelper.getWidth(context) / 2,
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
              width: UiHelper.getWidth(context) / 2,
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
