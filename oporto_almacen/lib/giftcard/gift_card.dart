import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:oporto_almacen/generics/CustomDrawer.dart';
import 'package:oporto_almacen/helpers/ui_helper.dart';

class GiftCard extends StatefulWidget {
  @override
  _GiftCardState createState() => _GiftCardState();
}

class _GiftCardState extends State<GiftCard> {
  String _selectedDate = "";
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    Future _selectDate() async {
      DateTime picked = await showDatePicker(
        //hace que se disableen todas las fechas anteriores al dia de la fecha
        selectableDayPredicate: (DateTime date) =>
            date.compareTo(DateTime.now().subtract(Duration(days: 1))) >= 0,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(DateTime.now().year + 1),
        //locale: Locale('es'),
      );
      if (picked != null)
        setState(
          () {
            _selectedDate = DateFormat.yMMMMd('es').format(picked);
          },
        );
    }

    double fontSize = UiHelper.getOrientation(context) == Orientation.landscape
        ? UiHelper.getHeight(context) / 30
        : UiHelper.getWidth(context) / 30;
    return Scaffold(
      drawer: CustomDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
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
                  'Gift Card',
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
                            image:
                                AssetImage('assets/images/gift_card_image.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: UiHelper.getWidth(context),
                          //height: 50,
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).highlightColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'A quien se lo quieras regalar le llegará un e-mail con el código, para que pueda canjearlo inmediatamente en nuestro salón.',
                                style: GoogleFonts.comfortaa(
                                  textStyle: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          UiHelper.getWidth(context) / 40),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Monto a regalar',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$2.800 - ALMUERZO Y CENA',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Mensaje al agasajado',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //height: MediaQuery.of(context).size.height * 0.12,
                    child: TextField(
                        //controller: widget.controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                        ),
                        maxLines: null,
                        style: GoogleFonts.comfortaa()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Fecha del regalo',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //height: MediaQuery.of(context).size.height * 0.12,
                    child: InkWell(
                      onTap: () => _selectDate(),
                      child: IgnorePointer(
                        child: TextField(
                            controller:
                                TextEditingController(text: _selectedDate),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                            ),
                            maxLines: null,
                            style: GoogleFonts.comfortaa()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Tu nombre',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //height: MediaQuery.of(context).size.height * 0.12,
                    child: TextField(
                        //controller: widget.controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                        ),
                        maxLines: null,
                        style: GoogleFonts.comfortaa()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Nombre del agasajado',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //height: MediaQuery.of(context).size.height * 0.12,
                    child: TextField(
                        //controller: widget.controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                        ),
                        maxLines: null,
                        style: GoogleFonts.comfortaa()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Email del agasajado',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    //padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //height: MediaQuery.of(context).size.height * 0.12,
                    child: TextField(
                        //controller: widget.controller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor)),
                        ),
                        maxLines: null,
                        style: GoogleFonts.comfortaa()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'COMPRAR',
                        style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.w900,textStyle: TextStyle(color: Theme.of(context).accentColor)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
