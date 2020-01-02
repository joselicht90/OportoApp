import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oporto_almacen/generics/BackgroundContainer.dart';
import 'package:oporto_almacen/generics/CustomDrawer.dart';
import 'package:oporto_almacen/helpers/ui_helper.dart';

class Carta extends StatefulWidget {
  @override
  _CartaState createState() => _CartaState();
}

class _CartaState extends State<Carta> with TickerProviderStateMixin {
  TabController _tabController;
  TabController _tab1Controller;
  TabController _tab2Controller;
  int _currentTab = 0;
  int _currentTabMN = 0;
  int _currentTabMT = 0;
  List<Widget> tab1Options = List<Widget>();
  List<Widget> tab2Options = List<Widget>();

  void _handleTabChange() {
    setState(() {
      _currentTab = _tabController.index;
    });
  }

  void _handleTabChangeMN() {
    setState(() {
      _currentTabMN = _tab1Controller.index;
    });
  }

  void _handleTabChangeMT() {
    setState(() {
      _currentTabMT = _tab2Controller.index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabChange);
    _tab1Controller = TabController(vsync: this, length: 5);
    _tab1Controller.addListener(_handleTabChangeMN);
    _tab2Controller = TabController(vsync: this, length: 2);
    _tab2Controller.addListener(_handleTabChangeMT);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tab1Controller.dispose();
    _tab2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tab1Options.addAll([
      getPlatosPrincipales(context),
      getRaciones(context),
      getEnsaladas(context),
      getEspecialidades(context),
      getEntradas(context)
    ]);

    tab2Options.addAll([
      getSalados(context),
      getDulces(context),
    ]);
    if (UiHelper.getOrientation(context) == Orientation.portrait) {
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
                image: AssetImage('assets/images/carta_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            drawer: CustomDrawer(),
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0x50FFFFFF),
              title: Text(
                'Carta',
                style: GoogleFonts.comfortaa(
                  fontWeight: FontWeight.bold,
                  textStyle: TextStyle(color: Colors.black),
                ),
              ),
              centerTitle: true,
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
              bottom: TabBar(
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Mediodia + Noche',
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Mañana + Tarde',
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    TabBar(
                      controller: _tab1Controller,
                      tabs: <Widget>[
                        Tab(
                          child: Text(
                            'Principales',
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: UiHelper.getWidth(context) / 50,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Raciones',
                            style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: UiHelper.getWidth(context) / 50,
                                    fontWeight: FontWeight.w900)),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Ensaladas',
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: UiHelper.getWidth(context) / 50,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Quesos y Embutidos',
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: UiHelper.getWidth(context) / 50,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Entradas',
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: UiHelper.getWidth(context) / 50,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: tab1Options[_currentTabMN],
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    TabBar(
                      controller: _tab2Controller,
                      tabs: <Widget>[
                        Tab(
                          child: Text(
                            'Salados',
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Dulces',
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: tab2Options[_currentTabMT],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          BackgroundContainer(),
          Container(
            width: UiHelper.getWidth(context) * 0.62,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.transparent],
                ).createShader(
                    Rect.fromLTRB(0, 0, rect.width * 0.62, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image(
                image: AssetImage('assets/images/carta_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: UiHelper.getWidth(context) * 0.5,
            child: Scaffold(
              drawer: CustomDrawer(),
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Color(0x50FFFFFF),
                title: Text(
                  'Carta',
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.bold,
                    textStyle: TextStyle(color: Colors.black),
                  ),
                ),
                centerTitle: true,
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
                bottom: TabBar(
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        'Mediodia + Noche',
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Mañana + Tarde',
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      TabBar(
                        controller: _tab1Controller,
                        tabs: <Widget>[
                          Tab(
                            child: Text(
                              'Principales',
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: UiHelper.getWidth(context) / 70,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Raciones',
                              style: GoogleFonts.comfortaa(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: UiHelper.getWidth(context) / 70,
                                      fontWeight: FontWeight.w900)),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Ensaladas',
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: UiHelper.getWidth(context) / 70,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Quesos y Embutidos',
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: UiHelper.getWidth(context) / 70,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Entradas',
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: UiHelper.getWidth(context) / 70,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      TabBar(
                        controller: _tab2Controller,
                        tabs: <Widget>[
                          Tab(
                            child: Text(
                              'Salados',
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Dulces',
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: UiHelper.getWidth(context) * 0.5,
              child: Material(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: _currentTab == 0
                          ? tab1Options[_currentTabMN]
                          : tab2Options[_currentTabMT],
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
}

class Plato extends StatelessWidget {
  final String title;
  Plato({this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(3),
                margin: const EdgeInsets.symmetric(horizontal: 1),
                height: UiHelper.getOrientation(context) == Orientation.portrait
                    ? UiHelper.getHeight(context) * 0.02
                    : UiHelper.getWidth(context) * 0.02,
                width: UiHelper.getOrientation(context) == Orientation.portrait
                    ? UiHelper.getHeight(context) * 0.02
                    : UiHelper.getWidth(context) * 0.02,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
                child: Container(
                  height: UiHelper.getHeight(context) * 0.01,
                  width: UiHelper.getHeight(context) * 0.01,
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '- $title',
                  style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget getPlatosPrincipales(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Plato(
          title:
              'Brochette de pollo organico con cous cous, zanahorias asada y mayonesa de cilantro',
        ),
        Plato(
          title:
              'Ñoquis dorados a la manteca con pesto de limones y queso pecorino',
        ),
        Plato(
          title:
              'Milanesa de lomo con spaghettini a la manteca y queso reggio “la suerte”',
        ),
        Plato(
          title: 'Lasagna de carne de cerdo',
        ),
        Plato(
          title: 'Risotto de esparragos organicos y panceta crujiente',
        ),
        Plato(
          title:
              'Plato detox: risotto de quinoa con jengibre, coliflor grillado, pak choi y pasta de castañas',
        ),
        Plato(
          title:
              'Plato detox bis: Arroz yamaní, cabutia, brócoli, semillas de zapallo y veganesa de zanahoria',
        ),
        Plato(
          title:
              'Pesca del dia: Con crema de papa y aceitunas, ensalada de hinojo, cebolla morada y tomillo',
        ),
        Plato(
          title: 'Ojo de bife con pak choi y papas dauphine',
        ),
      ],
    ),
  );
}

Widget getRaciones(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Plato(
          title: 'Pate al oporto',
        ),
        Plato(
          title: 'Buñuelos de espinaca 2 u',
        ),
        Plato(
          title: 'Tortilla de papa con alioli',
        ),
        Plato(
          title: 'Vitel Tone',
        ),
        Plato(
          title: 'Esparragos organicos con queso feta y menta fresca',
        ),
        Plato(
          title: 'Empanadas de carne fritas 2 u',
        ),
        Plato(
          title: 'Alcauciles en conserva',
        ),
        Plato(
          title: ' Croquetas de arroz y queso azul',
        ),
        Plato(
          title: 'Aceitunas maceradas en oliva y piel de limón',
        ),
      ],
    ),
  );
}

Widget getEspecialidades(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Plato(
          title:
              'Plato de quesos "la suerte" cheddar, lincoln, y brie doble crema',
        ),
        Plato(
          title:
              'Plato de embutidos "las dinas" salamín tandilero, salamín con avellanas, salame picado fino',
        ),
        Plato(
          title: 'Morbier',
        ),
        Plato(
          title: 'Reggio',
        ),
        Plato(
          title: 'Cheddar',
        ),
        Plato(
          title: 'Lincoln',
        ),
        Plato(
          title: 'Potagonzola',
        ),
        Plato(
          title: 'Pecorino',
        ),
        Plato(
          title: '1/2 burrata',
        ),
        Plato(
          title: 'Jamon horneado',
        ),
        Plato(
          title: 'Jamon crudo',
        ),
      ],
    ),
  );
}

Widget getEnsaladas(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Plato(
          title:
              'Pollo crispy: pollo frito apanado con cereal, lechuga morada, rúcula, castañas, aderezo de maní y huevo mollet',
        ),
        Plato(
          title: 'Cabutia y burrata: rúcula y castañas de cajú tostadas',
        ),
        Plato(
          title:
              'Quinoa: kale, lechuga, palta, naranja, pasas de uva y vinagreta de dijon',
        ),
      ],
    ),
  );
}

Widget getEntradas(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Plato(
          title: 'Buñuelos de espinaca 5 u',
        ),
        Plato(
          title: 'Bresaola de wagyu con escabeche de hongos y verdes',
        ),
        Plato(
          title: 'Burrata y gazpacho de frutillas',
        ),
        Plato(
          title: 'Berenjenas a la parmesana',
        ),
        Plato(
          title: 'Pulpetines de cerdo con salsa de tomate y albahaca fresca',
        ),
        Plato(
          title:
              'Provoleta de bufala con ensalada de rúcula tomate confitado y cebolla',
        ),
        Plato(
          title: 'Ceviche de pesca blanca',
        ),
        Plato(
          title:
              'Camarones con salsa golf tartare de palta y crocante de brioche',
        ),
      ],
    ),
  );
}

Widget getSalados(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Plato(
          title: 'Tostado de queso a la plancha',
        ),
        Plato(
          title: 'Sandwich de jamón crudo y manteca',
        ),
        Plato(
          title: 'Sandwich de jamón, queso y tomate confitado',
        ),
      ],
    ),
  );
}

Widget getDulces(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Plato(
          title: 'Tostadas con queso crema y mermelada',
        ),
        Plato(
          title: 'Budin de cacao',
        ),
        Plato(
          title: 'Budin de citricos',
        ),
        Plato(
          title: 'Tarta del dia',
        ),
      ],
    ),
  );
}
