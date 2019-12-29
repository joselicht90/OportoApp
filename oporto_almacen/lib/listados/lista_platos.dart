import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oporto_almacen/generics/BackgroundContainer.dart';
import '../helpers/ui_helper.dart';
import '../helpers/ui_helper.dart';
import '../helpers/ui_helper.dart';
import '../helpers/ui_helper.dart';
import '../helpers/ui_helper.dart';

class ListadoPlatos extends StatefulWidget {
  final AssetImage heroImage;
  final String heroTag;
  final String title;

  ListadoPlatos({this.heroImage, this.heroTag, this.title});

  @override
  _ListadoPlatosState createState() => _ListadoPlatosState();
}

class _ListadoPlatosState extends State<ListadoPlatos> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = List<Widget>();
    for (int i = 0; i < 10; i++) {
      items.add(Container(
        margin: const EdgeInsets.all(10.0),
        height: UiHelper.getOrientation(context) == Orientation.portrait
            ? UiHelper.getHeight(context) / 7
            : UiHelper.getWidth(context) / 5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400],
                blurRadius: 5.0,
                spreadRadius: 0.5,
                offset: Offset(0.0, 5)),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                height: UiHelper.getOrientation(context) == Orientation.portrait
                    ? UiHelper.getHeight(context) / 7
                    : UiHelper.getWidth(context) / 5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/simple_fish_dish_98008_16x9.jpg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: UiHelper.getOrientation(context) == Orientation.portrait
                    ? UiHelper.getHeight(context) / 7
                    : UiHelper.getWidth(context) / 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Lorem Ipsum',
                        style: GoogleFonts.comfortaa(
                            fontWeight: FontWeight.bold,
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 20))),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut gravida enim. Nam ante nisi, porta in ullamcorper ut, hendrerit non eros. Quisque viverra tempor euismod. Cras dolor erat, suscipit eu malesuada sit amet, auctor nec ipsum. Ut sagittis odio id pulvinar vestibulum. Etiam vulputate maximus tellus, sed iaculis mi consequat ut. Nullam arcu purus, vulputate eget fermentum in, mattis at leo. Praesent sit amet dui et urna feugiat imperdiet sed a elit. In gravida ligula et vehicula imperdiet. Fusce maximus dui at pellentesque suscipit. Nam sit amet maximus odio, id lobortis ante. Vivamus eu purus a turpis lobortis ultrices et facilisis lectus. Nulla convallis purus non lectus cursus maximus. Aliquam consequat feugiat lectus et auctor. Cras ornare vitae enim sit amet luctus. Morbi mattis neque in feugiat pretium. ',
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          //maxLines: 4,
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
    }
    return Stack(
      children: <Widget>[
        BackgroundContainer(),
        // Hero(
        //   tag: widget.heroTag,
        //   child: Container(
        //     child: ShaderMask(
        //       shaderCallback: (rect) {
        //         return LinearGradient(
        //           begin: Alignment.topCenter,
        //           end: Alignment.bottomCenter,
        //           colors: [Colors.white, Colors.transparent],
        //         ).createShader(
        //             Rect.fromLTRB(0, 0, rect.width, rect.height / 1.2));
        //       },
        //       blendMode: BlendMode.dstIn,
        //       child: Image(
        //         image: widget.heroImage,
        //       ),
        //     ),
        //   ),
        // ),
        Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //     backgroundColor: Colors.transparent,
          //     elevation: 0,
          //     leading: Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.black,
          //     ),
          //     title: Text(widget.title,
          //         style: GoogleFonts.comfortaa(
          //             fontWeight: FontWeight.bold,
          //             textStyle: TextStyle(color: Colors.black)))),
          // body: ListView(
          //   padding: const EdgeInsets.all(8.0),
          //   children: items,
          // ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                elevation: 0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(widget.title,
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.black))),
                  centerTitle: true,
                  background: Hero(
                      tag: widget.heroTag,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: UiHelper.getWidth(context),
                            child: ShaderMask(
                              shaderCallback: (rect) {
                                return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Colors.white, Colors.transparent],
                                ).createShader(Rect.fromLTRB(
                                    0, 0, rect.width, rect.height));
                              },
                              blendMode: BlendMode.dstIn,
                              child: Image(
                                image: widget.heroImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: UiHelper.getWidth(context) / 5,
                              child:
                                  Image.asset('assets/icons/oporto_logo.png'),
                            ),
                          ),
                        ],
                      )),
                ),
                expandedHeight: UiHelper.getHeight(context) / 2,
                backgroundColor: Colors.white,
              ),
              SliverList(
                delegate: SliverChildListDelegate(items),
              ),
            ],
          ),
        )
      ],
    );
  }
}
