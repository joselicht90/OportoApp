import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oporto_almacen/generics/BackgroundContainer.dart';
import 'package:oporto_almacen/generics/CustomDrawer.dart';
import 'package:oporto_almacen/helpers/ui_helper.dart';
import 'package:oporto_almacen/generics/CustomDivider.dart';

class InfoOporto extends StatefulWidget {
  @override
  _InfoOportoState createState() => _InfoOportoState();
}

class _InfoOportoState extends State<InfoOporto> {
  @override
  Widget build(BuildContext context) {
    double fontSize = UiHelper.getOrientation(context) == Orientation.landscape
        ? UiHelper.getHeight(context) / 30
        : UiHelper.getWidth(context) / 30;
    List<Widget> images = List<Widget>();
    images.addAll([
      Container(
        width: UiHelper.getWidth(context),
        height: UiHelper.getHeight(context),
        child: Image.asset(
          'assets/images/slider-00.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: UiHelper.getWidth(context),
        height: UiHelper.getHeight(context),
        child: Image.asset(
          'assets/images/slider-01.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: UiHelper.getWidth(context),
        height: UiHelper.getHeight(context),
        child: Image.asset(
          'assets/images/slider-02.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: UiHelper.getWidth(context),
        height: UiHelper.getHeight(context),
        child: Image.asset(
          'assets/images/slider-03.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: UiHelper.getWidth(context),
        height: UiHelper.getHeight(context),
        child: Image.asset(
          'assets/images/slider-04.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: UiHelper.getWidth(context),
        height: UiHelper.getHeight(context),
        child: Image.asset(
          'assets/images/slider-06.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: UiHelper.getWidth(context),
        height: UiHelper.getHeight(context),
        child: Image.asset(
          'assets/images/slider-07.jpg',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: UiHelper.getWidth(context),
        height: UiHelper.getHeight(context),
        child: Image.asset(
          'assets/images/slider-08.jpg',
          fit: BoxFit.cover,
        ),
      ),
    ]);
    if (UiHelper.getOrientation(context) == Orientation.portrait) {
      return Stack(
        children: <Widget>[
          BackgroundContainer(),
          CarouselSlider(
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              height: UiHelper.getOrientation(context) == Orientation.portrait
                  ? UiHelper.getHeight(context) / 2
                  : UiHelper.getWidth(context) / 2,
              //enlargeCenterPage: true,
              items: images),
          Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
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
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    25, UiHelper.getHeight(context) / 2.5, 25, 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
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
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Oporto nace desde el entusiasmo de hacerlo simple, rico y agradable. Con la intención de reivindicar platos de nuestra infancia trabajamos sobre recetas originarias con productos frescos y de estación.',
                            style: GoogleFonts.cairo(
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                          ),
                          CustomDivider(),
                          Text(
                            'Diseñado por Horacio Gallo, nuestro espacio cita las calles de Oporto con un estilo ecléctico-industrial. Azulejo blanco en dosis audaces, madera cruda, hierro forjado negro, cuero, mármol y vidrio son el mix de materiales que lo definen, además de sus proporciones. Oporto almacén invita a una experiencia contemporánea, cálida y hedonista.',
                            style: GoogleFonts.cairo(
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                          ),
                          CustomDivider(),
                          Text(
                            'En Oporto realizamos eventos sociales y corporativos. Desde casamientos hasta presentaciones de producto. En el momento que mejor se adapte a la propuesta requerida por el cliente: desayuno, almuerzo, té o cena. Inclusive planificamos degustaciones de vino para grupos de 10 personas en adelante. Escribinos para saber lo que estas buscando.',
                            style: GoogleFonts.cairo(
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          BackgroundContainer(),
          Container(
            height: UiHelper.getHeight(context),
            width: UiHelper.getWidth(context) / 2,
            child: CarouselSlider(
                scrollDirection: Axis.vertical,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                height: UiHelper.getHeight(context),
                //enlargeCenterPage: true,
                items: images),
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
            ),
            extendBodyBehindAppBar: true,
            body: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: UiHelper.getWidth(context) / 2,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: SafeArea(
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Oporto nace desde el entusiasmo de hacerlo simple, rico y agradable. Con la intención de reivindicar platos de nuestra infancia trabajamos sobre recetas originarias con productos frescos y de estación.',
                                style: GoogleFonts.cairo(
                                    fontSize: fontSize,
                                    fontStyle: FontStyle.italic),
                              ),
                              CustomDivider(),
                              Text(
                                'Diseñado por Horacio Gallo, nuestro espacio cita las calles de Oporto con un estilo ecléctico-industrial. Azulejo blanco en dosis audaces, madera cruda, hierro forjado negro, cuero, mármol y vidrio son el mix de materiales que lo definen, además de sus proporciones. Oporto almacén invita a una experiencia contemporánea, cálida y hedonista.',
                                style: GoogleFonts.cairo(
                                    fontSize: fontSize,
                                    fontStyle: FontStyle.italic),
                              ),
                              CustomDivider(),
                              Text(
                                'En Oporto realizamos eventos sociales y corporativos. Desde casamientos hasta presentaciones de producto. En el momento que mejor se adapte a la propuesta requerida por el cliente: desayuno, almuerzo, té o cena. Inclusive planificamos degustaciones de vino para grupos de 10 personas en adelante. Escribinos para saber lo que estas buscando.',
                                style: GoogleFonts.cairo(
                                    fontSize: fontSize,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
