import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:oporto_almacen/generics/CustomDrawer.dart';
import 'package:oporto_almacen/helpers/ui_helper.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  List<EventoOporto> eventos = [
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('10/04/2019'),
        title: 'BODEGA FINCA LA ANITA'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('15/04/2019'),
        title: 'INTRODUCCIÓN AL MUNDO DEL VINO'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('17/04/2019'),
        title: 'ARGENTINA = MALBEC'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('22/04/2019'),
        title: 'INTRODUCCIÓN AL MUNDO DEL VINO II'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('24/04/2019'),
        title: 'COSTA Y PAMPA'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('15/05/2019'),
        title: 'BODEGA CATENA ZAPATA'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('22/05/2019'),
        title: 'NO TODO ES MALBEC'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('28/05/2019'),
        title: 'QUESO LA SUERTE'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('09/07/2019'),
        title: 'MENU PATRIO'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('17/07/2019'),
        title: 'LA MASCOTA WINEYARDS'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('23/07/2019'),
        title: 'TALLER DE QUESOS "LA SUERTE"'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('24/07/2019'),
        title: 'CATA SENSORIAL DE THE GLENLIVET'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('11/09/2019'),
        title: 'DEGUSTACIÓN HAVANA CLUB'),
    EventoOporto(
        date: DateFormat('dd/MM/yyy').parse('26/09/2019'),
        title: 'DEGUSTACION PINOT NOIR ARGENTINOS'),
  ];
  @override
  Widget build(BuildContext context) {
    List<GridItemCalendario> items = List<GridItemCalendario>();
    for (int i = 0; i < eventos.length; i++) {
      items.add(
        GridItemCalendario(
          date: eventos[i].date,
          index: i,
          title: eventos[i].title,
        ),
      );
    }
    double fontSize = UiHelper.getOrientation(context) == Orientation.landscape
        ? UiHelper.getHeight(context) / 30
        : UiHelper.getWidth(context) / 30;
    return Scaffold(
      drawer: CustomDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
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
            title: Text(
              'Calendario',
              style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.bold,
                textStyle: TextStyle(color: Colors.black),
              ),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Container(
                    width: UiHelper.getWidth(context),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.transparent],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image(
                        image: AssetImage('assets/images/cocktails_image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'En Oporto realizamos eventos sociales y corporativos. Desde casamientos hasta presentaciones de producto. En el momento que mejor se adapte a la propuesta requerida por el cliente: desayuno, almuerzo, té o cena. Inclusive planificamos degustaciones de vino para grupos de 10 personas en adelante. Escribinos para saber lo que estas buscando.',
                        style: GoogleFonts.cairo(
                            fontSize: fontSize, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // AnimationLimiter(
          //   child: SliverGrid.count(
          //     crossAxisCount: 2,
          //     children: items,
          //   ),
          // ),
          AnimationLimiter(
            child: SliverGrid(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              delegate: SliverChildBuilderDelegate(
                  (context, index) => items[index],
                  childCount: items.length),
            ),
          )
        ],
      ),
    );
  }
}

class GridItemCalendario extends StatelessWidget {
  final int index;
  final DateTime date;
  final String title;
  const GridItemCalendario({
    this.index,
    this.date,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 375),
      columnCount: 2,
      child: FlipAnimation(
        child: FadeInAnimation(
          child: Container(
            margin: const EdgeInsets.all(10),
            color: Theme.of(context).highlightColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${DateFormat.MMMM('es').format(date).toString().toUpperCase()} ${date.year}',
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.bold,
                    textStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: UiHelper.getWidth(context) / 40),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    date.day.toString(),
                    style: GoogleFonts.lexendExa(
                      textStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w900,
                          fontSize: UiHelper.getWidth(context) / 6),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    title,
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: UiHelper.getWidth(context) / 40),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventoOporto {
  @required
  DateTime date;
  @required
  String title;

  EventoOporto({this.date, this.title});
}
