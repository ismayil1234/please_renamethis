import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:math';
// import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // List gridVieList = [
  //   'a',
  //   'b',
  //   'c',
  //   'd',
  //   'e',
  //   'g',
  //   'h',
  //   'i',
  //   'j',
  //   'k',
  //   'l',
  //   'm',
  //   'n',
  //   'p',
  //   'q',
  //   'r',
  //   's',
  //   't',
  //   'u',
  //   'v'
  // ];
  // final List<GlobalObjectKey> formKeyList =
  //     List.generate(20, (index) => GlobalObjectKey(index));
  //
  // List<GlobalKey> keyList = [GlobalKey()];
  // List cellKeyList = [];
  // List<TouchPoints> touchPointList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onPanStart: (details) {
          RenderBox renderBox = context.findRenderObject();
          // points.add()
        },
        onPanUpdate: (updateDetails) {},
        child: Stack(
          children: [
            // Center(child: Text('hai')),
            // GridView.builder(
            //     // key: gridKey,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         mainAxisExtent: 40,
            //         crossAxisCount: 4,
            //         crossAxisSpacing: 0.5,
            //         mainAxisSpacing: 0.5),
            //     itemCount: gridVieList.length,
            //     itemBuilder: (context, index) {
            //       // GlobalKey myKey = GlobalKey()
            //       // keyList[keyList.length-1]
            //       return Center(
            //           child: Text(gridVieList[index], key: formKeyList[index]));
            //     }),
            // Positioned(
            //   bottom: 120,
            //   child: TextButton(
            //     onPressed: () {
            //       // setState(() {});
            //       print('hai');
            //       // print(gridKey);
            //       // RenderBox box = gridKey.currentContext.findRenderObject();
            //       // Offset position = box.localToGlobal(Offset.zero);
            //       // double y = position.dy;
            //       // print('y is $y');
            //       // print('x is ${position.dx}');
            //       // print('distance is ${position.distanceSquared}');
            //       for (int i = 0; i < formKeyList.length; i++) {
            //         print('index is $i');
            //         print(formKeyList);
            //         if (formKeyList[i] != null) {
            //           RenderBox box =
            //               formKeyList[i].currentContext.findRenderObject();
            //           Offset position = box.localToGlobal(Offset.zero);
            //           print('x is ${position.dx}');
            //           print('y is ${position.dy}');
            //         }
            //       }
            //     },
            //     child: Text('get possition'),
            //   ),
            // ),
            CanvasPainting(),
            // CustomPaint(
            //   size: Size(200, 200),
            //   painter: MyPainter(pointsList: touchPointList),
            // )
            // MyPainter()
            // ElevatedButton(
            //     onPressed: () {},
            //     child: Text('THIS IS Elevated Button'),
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(Colors.green)))
          ],
        ),
      ),
    );
  }
}

// class MyPainter extends CustomPainter {
//   List<TouchPoints> pointsList;
//   List<Offset> offsetList = [];
//   MyPainter({this.pointsList});
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Rect.fromLTRB(50, 100, 250, 200);
//     final paint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4;
//     canvas.drawOval(rect, paint);
//   }

// @override
// bool shouldRepaint(covariant CustomPainter oldDelegate) {
//   return true;
// }
// }

// class TouchPoints {
//   Paint paint;
//   Offset offset;
//   var points;
//   TouchPoints({this.paint, this.offset,this.points});
// }

// import 'dart:typed_data';
// import 'dart:ui' as ui;
//
// import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';

//void main() => runApp(CanvasPainting());

class CanvasPainting extends StatefulWidget {
  @override
  _CanvasPaintingState createState() => _CanvasPaintingState();
}

class _CanvasPaintingState extends State<CanvasPainting> {
  GlobalKey globalKey = GlobalKey();

  List<TouchPoints> points = List();
  List<TouchPoints> pointsOnFinish = List();
  List<Map<String, dynamic>> savedList = List();
  double opacity = 1.0;
  StrokeCap strokeType = StrokeCap.round;
  double strokeWidth = 2.0;
  Color selectedColor = Colors.black;
  List<ResultEllipse> resultEllipseList = List();
  Future<void> _pickStroke() async {
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        //Clips its child in a oval shape
        return ClipOval(
          child: AlertDialog(
            //Creates three buttons to pick stroke value.
            actions: <Widget>[
              //Resetting to default stroke value
              FlatButton(
                child: Icon(
                  Icons.clear,
                ),
                onPressed: () {
                  strokeWidth = 3.0;
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Icon(
                  Icons.brush,
                  size: 24,
                ),
                onPressed: () {
                  strokeWidth = 10.0;
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Icon(
                  Icons.brush,
                  size: 40,
                ),
                onPressed: () {
                  strokeWidth = 30.0;
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Icon(
                  Icons.brush,
                  size: 60,
                ),
                onPressed: () {
                  strokeWidth = 50.0;
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _opacity() async {
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true,

      builder: (BuildContext context) {
        //Clips its child in a oval shape
        return ClipOval(
          child: AlertDialog(
            //Creates three buttons to pick opacity value.
            actions: <Widget>[
              FlatButton(
                child: Icon(
                  Icons.opacity,
                  size: 24,
                ),
                onPressed: () {
                  //most transparent
                  opacity = 0.1;
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Icon(
                  Icons.opacity,
                  size: 40,
                ),
                onPressed: () {
                  opacity = 0.5;
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Icon(
                  Icons.opacity,
                  size: 60,
                ),
                onPressed: () {
                  //not transparent at all.
                  opacity = 1.0;
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _save() async {
    RenderRepaintBoundary boundary =
        // globalKey
        formKeyList[0].currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();

    //Request permissions if not already granted
    // if (!(await Permission.storage.status.isGranted))
    //   await Permission.storage.request();
    //
    // final result = await ImageGallerySaver.saveImage(
    //     Uint8List.fromList(pngBytes),
    //     quality: 60,
    //     name: "canvas_image");
    // print(result);
  }

  List<Widget> fabOption() {
    return <Widget>[
      FloatingActionButton(
        heroTag: "paint_save",
        child: Icon(Icons.save),
        tooltip: 'Save',
        onPressed: () {
          //min: 0, max: 50
          setState(() {
            _save();
          });
        },
      ),
      FloatingActionButton(
        heroTag: "paint_stroke",
        child: Icon(Icons.brush),
        tooltip: 'Stroke',
        onPressed: () {
          //min: 0, max: 50
          setState(() {
            _pickStroke();
          });
        },
      ),
      FloatingActionButton(
        heroTag: "paint_opacity",
        child: Icon(Icons.opacity),
        tooltip: 'Opacity',
        onPressed: () {
          //min:0, max:1
          setState(() {
            _opacity();
          });
        },
      ),
      FloatingActionButton(
          heroTag: "erase",
          child: Icon(Icons.clear),
          tooltip: "Erase",
          onPressed: () {
            setState(() {
              points.clear();
            });
          }),
      FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "color_red",
        child: colorMenuItem(Colors.red),
        tooltip: 'Color',
        onPressed: () {
          setState(() {
            selectedColor = Colors.red;
          });
        },
      ),
      FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "color_green",
        child: colorMenuItem(Colors.green),
        tooltip: 'Color',
        onPressed: () {
          setState(() {
            selectedColor = Colors.green;
          });
        },
      ),
      FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "color_pink",
        child: colorMenuItem(Colors.pink),
        tooltip: 'Color',
        onPressed: () {
          setState(() {
            selectedColor = Colors.pink;
          });
        },
      ),
      FloatingActionButton(
        backgroundColor: Colors.white,
        heroTag: "color_blue",
        child: colorMenuItem(Colors.blue),
        tooltip: 'Color',
        onPressed: () {
          setState(() {
            selectedColor = Colors.blue;
          });
        },
      ),
    ];
  }

  List gridVieList = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v'
  ];
  final List<GlobalObjectKey> formKeyList =
      List.generate(21, (index) => GlobalObjectKey(index));
  updateResult(ResultEllipse resultEllipse) {
    if (resultEllipse != null) {
      // setState(() {
      resultEllipseList.add(resultEllipse);
      // });
    }
  }

  List<GlobalKey> keyList = [GlobalKey()];
  @override
  Widget build(BuildContext context) {
    Size paintSize;
    // if ((formKeyList.isNotEmpty) && (formKeyList[0].currentContext == null)) {
    //   RenderBox a = formKeyList[0].currentContext.findRenderObject();
    //   // RenderBox box = gridKey.currentContext.findRenderObject();
    //   //             //       // Offset position = box.localToGlobal(Offset.zero);
    //   //             //       // double y = position.dy;
    //   Offset position = a.localToGlobal(Offset.zero);
    //   paintSize = Size(position.dx, position.dy);
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              RenderBox renderBox = context.findRenderObject();
              // Offset position = renderBox.localToGlobal(Offset.zero);
              // print(position);
              RenderBox box = formKeyList[0].currentContext.findRenderObject();
              Offset offset = box.globalToLocal(details.globalPosition);
              // print(offset);
              // if()
              points.add(TouchPoints(
                  points: renderBox.globalToLocal(details.globalPosition),
                  paint: Paint()
                    ..strokeCap = strokeType
                    ..isAntiAlias = true
                    ..color = Colors.red
                    ..strokeWidth = strokeWidth
                    ..style = PaintingStyle.stroke));
              pointsOnFinish.add(TouchPoints(
                  points: renderBox.globalToLocal(details.globalPosition),
                  paint: Paint()
                    ..strokeCap = strokeType
                    ..isAntiAlias = true
                    ..color = Colors.red
                    ..strokeWidth = strokeWidth
                    ..style = PaintingStyle.stroke));

              // if(savedList!=null||savedList.isNotEmpty){
              //
              //
              //   savedList['pointsList'].add(TouchPoints(
              //       points: renderBox.globalToLocal(details.globalPosition),
              //       paint: Paint()
              //         ..strokeCap = strokeType
              //         ..isAntiAlias = true
              //         ..color = Colors.red
              //         ..strokeWidth = strokeWidth
              //         ..style = PaintingStyle.stroke));
              // });
              // }
            });
          },
          onPanStart: (details) {
            Color selColor;
            setState(() {
              RenderBox renderBox = context.findRenderObject();
              RenderBox box = formKeyList[0].currentContext.findRenderObject();
              Offset offset = box.globalToLocal(details.globalPosition);
              // print(offset);
              // Offset position = renderBox.localToGlobal(Offset.zero);
              // print(position);
              // if (position.dy > 2) {
              //   selColor = Colors.blue;
              // } else if (position.dx > 2) {
              //   selColor = Colors.red;
              // }
              //selectedColor.withOpacity(opacity)
              //selectedColor == null ? Colors.black : selColor
              //selectedColor.withOpacity(opacity)
              points.add(TouchPoints(
                  points: renderBox.globalToLocal(details.globalPosition),
                  paint: Paint()
                    ..strokeCap = strokeType
                    ..isAntiAlias = true
                    ..color = Colors.red
                    ..strokeWidth = strokeWidth
                    ..style = PaintingStyle.stroke));
              pointsOnFinish.add(TouchPoints(
                  points: renderBox.globalToLocal(details.globalPosition),
                  paint: Paint()
                    ..strokeCap = strokeType
                    ..isAntiAlias = true
                    ..color = Colors.red
                    ..strokeWidth = strokeWidth
                    ..style = PaintingStyle.stroke));
              // for(int i=0;i<pointsOnFinish.length;i++){
              Map<String, dynamic> myMap = {};
              double dx = pointsOnFinish.first.points.dx;
              double dy = pointsOnFinish.first.points.dy;
              double dxLast =
                  pointsOnFinish[pointsOnFinish.length - 1].points.dx;
              double dyLast =
                  pointsOnFinish[pointsOnFinish.length - 1].points.dy;
              TouchPoints t = TouchPoints(
                  points: renderBox.globalToLocal(details.globalPosition),
                  paint: Paint()
                    ..strokeCap = strokeType
                    ..isAntiAlias = true
                    ..color = Colors.red
                    ..strokeWidth = strokeWidth
                    ..style = PaintingStyle.stroke);
              myMap['touchPoint'] = t;
              myMap['startOffset'] = Offset(dx, dy);
              myMap['endOffset'] = Offset(dxLast, dyLast);
              savedList.add(myMap);
              // }
            });
          },
          onPanEnd: (details) {
            setState(() {
              pointsOnFinish = points;
              double lowestX;
              double lowestY;
              double largestX;
              double largestY;
              // print(pointsOnFinish);
              // print(pointsOnFinish);
              // print(pointsOnFinish.first);
              // print(pointsOnFinish.first.points);
              lowestX = pointsOnFinish.first.points.dx;
              lowestY = pointsOnFinish.first.points.dy;
              if (pointsOnFinish.last == null) {
                largestX = pointsOnFinish[pointsOnFinish.length - 2].points.dx;
                largestY = pointsOnFinish[pointsOnFinish.length - 2].points.dy;
              } else {
                largestX = pointsOnFinish.last.points.dx;
                largestY = pointsOnFinish.last.points.dy;
              }

              // largestX = finalList.last.points.dx;
              // largestY = finalList.last.points.dy;
              Offset a = Offset(lowestX, lowestY);
              Offset b = Offset(largestX, largestY);
              ResultEllipse resultEllipse = ResultEllipse();
              resultEllipse.startingOffset = a;
              resultEllipse.endingOffset = b;
              resultEllipseList.add(resultEllipse);
              // pointsList[i + 1].points;
              // Rect rect = Rect.fromPoints(a, b);
              // canvas.drawOval(rect, pointsOnFinish[i].paint);
              Map<String, dynamic> myMap = {};
              // myMap['touchPoint'] = pointsOnFinish;
              myMap['startOffset'] = a;
              myMap['endOffset'] = b;
              print(savedList);
              RenderBox renderBox = context.findRenderObject();
              // Offset position = renderBox.localToGlobal(Offset.zero);
              // print(position);
              RenderBox box = formKeyList[0].currentContext.findRenderObject();
              // TouchPoints t = TouchPoints(
              //     points: renderBox.globalToLocal(details.globalPosition),
              //     paint: Paint()
              //       ..strokeCap = strokeType
              //       ..isAntiAlias = true
              //       ..color = Colors.red
              //       ..strokeWidth = strokeWidth
              //       ..style = PaintingStyle.stroke);
              myMap['touchPoint'] = pointsOnFinish;
              if (savedList == []) {
                savedList[0] = myMap;
              } else {
                savedList.add(myMap);
              }
              points.add(null);
              // print(pointsOnFinish);
            });
          },
          child: RepaintBoundary(
            key: formKeyList.isNotEmpty ? formKeyList[0] : GlobalKey(),
            // globalKey,
            child: Stack(
              children: <Widget>[
                GridView.builder(
                    // key: gridKey,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 40,
                        crossAxisCount: 4,
                        crossAxisSpacing: 0.5,
                        mainAxisSpacing: 0.5),
                    itemCount: gridVieList.length,
                    itemBuilder: (context, index) {
                      // GlobalKey myKey = GlobalKey()
                      // keyList[keyList.length-1]
                      return Center(
                          child: Text(gridVieList[index],
                              key: formKeyList[index + 1]));
                    }),
                Positioned(
                  bottom: 120,
                  child: TextButton(
                    onPressed: () {
                      // setState(() {});
                      print('hai');
                      // print(gridKey);
                      // RenderBox box = gridKey.currentContext.findRenderObject();
                      // Offset position = box.localToGlobal(Offset.zero);
                      // double y = position.dy;
                      // print('y is $y');
                      // print('x is ${position.dx}');
                      // print('distance is ${position.distanceSquared}');
                      for (int i = 1; i < formKeyList.length; i++) {
                        print('index is $i');
                        print(formKeyList);
                        if (formKeyList[i] != null) {
                          RenderBox box =
                              formKeyList[i].currentContext.findRenderObject();
                          Offset position = box.localToGlobal(Offset.zero);
                          // print('x is ${position.dx}');
                          // print('y is ${position.dy}');
                        }
                      }
                    },
                    child: Text('get possition'),
                  ),
                ),

                // Center(child: Text('')
                //     // Image.asset("assets/images/hut.png"),
                //     ),
                resultEllipseList != []
                    ? CustomPaint(
                        size: Size(300, 300),
                        painter: MyPainter2(reList: resultEllipseList),
                      )
                    : SizedBox(),
                CustomPaint(
                  size: Size(300, 300),
                  // getSize(context,
                  //     k: formKeyList[0].currentContext.findRenderObject()),
                  // paintSize != null ? paintSize : Size(200, 200),
                  // formKeyList[0].
                  // Size.infinite,
                  painter: MyPainter(
                    pointsList: points,
                    finalList: pointsOnFinish,
                    myList: savedList,
                    context: context,
                    // resultUpdateCallBack: updateResult,
                  ),
                ),
                Positioned(
                    right: 20,
                    bottom: 100,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          // points.last.points = Offset.zero;
                          if (resultEllipseList.isNotEmpty)
                            resultEllipseList.removeLast();
                          if (pointsOnFinish.isNotEmpty)
                            pointsOnFinish.removeLast();
                        });
                      },
                      icon: Text('undo'),
                    ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              points.clear();
              resultEllipseList.clear();
            });
          },
          child: Icon(Icons.delete_outline),
          // AnimatedFloatingActionButton(
          //   fabButtons: fabOption(),
          //   colorStartAnimation: Colors.blue,
          //   colorEndAnimation: Colors.cyan,
          //   animatedIconData: AnimatedIcons.menu_close,
        ),
      ),
    );
  }

  Size getSize(BuildContext context, {RenderBox k}) {
    print(k);
    RenderBox box = k;
    Offset position = box.localToGlobal(Offset.zero);
    return Size(position.dx, position.dy);
  }

  Widget colorMenuItem(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          height: 36,
          width: 36,
          color: color,
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter(
      {this.pointsList,
      this.finalList,
      this.context,
      this.myList,
      this.resultEllipseList,
      this.resultUpdateCallBack});

  //Keep track of the points tapped on the screen
  List<TouchPoints> pointsList;
  List<TouchPoints> finalList;
  List<Map<String, dynamic>> myList;
  Function resultUpdateCallBack;
  final BuildContext context;
  List<ResultEllipse> resultEllipseList;
  List<Offset> offsetPoints = List();

  //This is where we can draw on canvas.
  @override
  void paint(Canvas canvas, Size size) {
    double largestX;
    double largestY;
    double lowestX;
    double lowestY;
    // List<Map<String, dynamic>> myList=[];
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        // Drawing line when two consecutive points are available
        // Rect rect = (pointsList[i].points & Size(30.0, 30.0));
        // canvas.drawOval(rect, pointsList[i].paint);

        // if (pointsList[i].points.dx > pointsList[i + 1].points.dx) {
        //   largestX = pointsList[i].points.dx;
        //   lowestX = pointsList[i + 1].points.dx;
        // } else if (pointsList[i + 1].points.dx > pointsList[i].points.dx) {
        //   largestX = pointsList[i + 1].points.dx;
        //   lowestX = pointsList[i].points.dx;
        // }
        // if (pointsList[i].points.dy > pointsList[i + 1].points.dy) {
        //   largestY = pointsList[i].points.dy;
        //   lowestY = pointsList[i + 1].points.dy;
        // } else if (pointsList[i + 1].points.dy > pointsList[i].points.dy) {
        //   largestY = pointsList[i + 1].points.dy;
        //   lowestY = pointsList[i].points.dy;
        // }

        final startAngle = pi / 2;
        final sweepAngle = pi;
        Offset center = Offset(size.width * 0.5, size.height * 0.5);
        int lineAmount = 10;
        Color paintColor = Color.fromRGBO(250, 154, 210, 1);
        Paint circlePaint = Paint()
          ..color = paintColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1;

        // HIGHLIGHT
        // canvas.drawOval(Rect.fromLTRB(50, 100, 250, 130), circlePaint);
        // canvas.t
        // canvas.drawArc(Rect.fromLTRB(50, 100, 250, 130), startAngle, sweepAngle,
        //     false, circlePaint);
        // canvas.drawArc(Rect.fromLTRB(50, 100, 250, 130), -startAngle,
        //     -sweepAngle, false, circlePaint);
        // Path path=
        //   canvas.drawPath(path, paint)
        lowestX = pointsList.first.points.dx;
        lowestY = pointsList.first.points.dy;
        if (pointsList.last == null) {
          largestX = pointsList[pointsList.length - 2].points.dx;
          largestY = pointsList[pointsList.length - 2].points.dy;
        } else {
          largestX = pointsList.last.points.dx;
          largestY = pointsList.last.points.dy;
        }

        // print('lowestX : $lowestX');
        // print('lowestY : $lowestY');
        // print('largestX : $largestX');
        // print('lowestX : $largestY');
        Offset a = Offset(lowestX, lowestY);
        Offset b = Offset(largestX, largestY);
        // pointsList[i + 1].points;
        Rect rect = Rect.fromPoints(a, b);
        canvas.drawOval(rect, pointsList[i].paint);

        // canvas.drawLine(pointsList[i].points, pointsList[i + 1].points,
        //     pointsList[i].paint);
      }
      // else if (pointsList[i] != null &&
      //     pointsList[i + 1] == null &&
      //     finalList.isNotEmpty) {
      //   final startAngle = pi / 2;
      //   final sweepAngle = pi;
      //   Offset center = Offset(size.width * 0.5, size.height * 0.5);
      //   int lineAmount = 10;
      //   Color paintColor = Color.fromRGBO(250, 154, 210, 1);
      //   Paint circlePaint = Paint()
      //     ..color = paintColor
      //     ..style = PaintingStyle.stroke
      //     ..strokeWidth = 1;
      //
      //   lowestX = finalList.first.points.dx;
      //   lowestY = finalList.first.points.dy;
      //   if (finalList.last == null) {
      //     largestX = finalList[pointsList.length - 2].points.dx;
      //     largestY = finalList[pointsList.length - 2].points.dy;
      //   } else {
      //     largestX = pointsList.last.points.dx;
      //     largestY = pointsList.last.points.dy;
      //   }
      //
      //   // largestX = finalList.last.points.dx;
      //   // largestY = finalList.last.points.dy;
      //   Offset a = Offset(lowestX, lowestY);
      //   Offset b = Offset(largestX, largestY);
      //   // ResultEllipse resultEllipse = ResultEllipse();
      //   // resultEllipse.startingOffset = a;
      //   // resultEllipse.endingOffset = b;
      //   // resultUpdateCallBack(resultEllipse);
      //   // resultEllipseList.add(resultEllipse);
      //
      //   // pointsList[i + 1].points;
      //   Rect rect = Rect.fromPoints(a, b);
      //   canvas.drawOval(rect, finalList[i].paint);
      //   // Map<String, dynamic> myMap = {};
      //   // myMap['touchPoint'] = finalList;
      //   // myMap['startOffset'] = a;
      //   // myMap['endOffset'] = b;
      //   // if (myList == []) {
      //   //   myList[0] = myMap;
      //   // } else
      //   //   myList.add(myMap);
      //   // showModalBottomSheet(
      //   //   context: context,
      //   //   builder: (context) {
      //   //     return BottomSheet(
      //   //       builder: (context) => Container(
      //   //         child: Text('Submit'),
      //   //       ),
      //   //       onClosing: () {
      //   //         Navigator.pop(context);
      //   //       },
      //   //     );
      //   //   },
      //   // );
      // }
      // else if (pointsList[i] != null && pointsList[i + 1] == null) {
      //   offsetPoints.clear();
      //   offsetPoints.add(pointsList[i].points);
      //   offsetPoints.add(Offset(
      //       pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));
      //
      //   //Draw points when two points are not next to each other
      //   canvas.drawPoints(
      //       ui.PointMode.points, offsetPoints, pointsList[i].paint);
      // }
    }

    // if (myList != null && myList.isNotEmpty) {
    //   for (int i = 0; i < myList.length; i++) {
    //     print(myList);
    //     // print(myList.first);
    //     // print(myList[i]['touchPoint'].first.points);
    //     // lowestX = myList[i]['touchPoint'].first.points.dx;
    //     // lowestY = myList[i]['touchPoint'].first.points.dy;
    //     // if (myList.last == null) {
    //     //   largestX = myList[i]['touchPoint'][pointsList.length - 2].points.dx;
    //     //   largestY = myList[i]['touchPoint'][pointsList.length - 2].points.dy;
    //     // } else {
    //     //   largestX = myList[i]['touchPoint'].last.points.dx;
    //     //   largestY = myList[i]['touchPoint'].last.points.dy;
    //     // }
    //
    //     // largestX = finalList.last.points.dx;
    //     // largestY = finalList.last.points.dy;
    //     Offset a = myList[i]['startOffset'];
    //     // myMap['startOffset']=a;
    //     //         myMap['endOffset']=b
    //     // Offset(lowestX, lowestY);
    //     Offset b = myList[i]['endOffset'];
    //     // Offset(largestX, largestY);
    //     // pointsList[i + 1].points;
    //     Rect rect = Rect.fromPoints(a, b);
    //     canvas.drawOval(rect, myList[i]['touchPoint'].paint);
    //   }
    // }
    // for(int i=0;i<
    print('hai 1');
    // resultUpdateCallBack();
    // if (resultEllipseList.isNotEmpty) {
    //   print('hai 2');
    //   for (int i = 0; i < resultEllipseList.length; i++) {
    //     Offset a = resultEllipseList[i].startingOffset;
    //     Offset b = resultEllipseList[i].startingOffset;
    //     print(a);
    //     print(b);
    //     // ..strokeCap = strokeType
    //     Paint paints = Paint()
    //       ..isAntiAlias = true
    //       ..color = Colors.red
    //       ..strokeWidth = 3
    //       ..style = PaintingStyle.stroke;
    //     Rect rect = Rect.fromPoints(a, b);
    //     canvas.drawOval(rect, paints);
    //   }
    // }
  }

  //Called when CustomPainter is rebuilt.
  //Returning true because we want canvas to be rebuilt to reflect new changes.
  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}

//Class to define a point touched at canvas
class TouchPoints {
  Paint paint;
  Offset points;
  TouchPoints({this.points, this.paint});
}

class AnimatedFloatingActionButton extends StatefulWidget {
  final List<Widget> fabButtons;
  // : fabOption(),
  final Color colorStartAnimation;
  // : Colors.blue,
  final Color colorEndAnimation;
  // : Colors.cyan,
  final AnimatedIconData animatedIconData;
  // : AnimatedIcons.menu_close,
  AnimatedFloatingActionButton(
      {this.animatedIconData,
      this.colorEndAnimation,
      this.colorStartAnimation,
      this.fabButtons});

  @override
  _AnimatedFloatingActionButtonState createState() =>
      _AnimatedFloatingActionButtonState();
}

class _AnimatedFloatingActionButtonState
    extends State<AnimatedFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      setState(() {});
      widget.fabButtons[0].createElement();
    });
  }
}

// Widget AnimatedFloatingActionButton(){
//   return FloatingActionButton(onPressed: (){
//
//   });
// }
class ResultEllipse {
  Offset startingOffset;
  Offset endingOffset;
  ResultEllipse({this.startingOffset, this.endingOffset});
}

class MyPainter2 extends CustomPainter {
  List<ResultEllipse> reList;
  MyPainter2({this.reList});
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < reList.length; i++) {
      Color color;
      double diff;
      Offset a = reList[i].startingOffset;
      Offset b = reList[i].endingOffset;
      // if (a.dx.abs() - b.dx.abs() > 50) {
      //   color = Colors.blue;
      // } else if (a.dy == b.dy) {
      //   print('a.dx: ${a.dx.abs()}');
      //   print('b.dx: ${b.dx.abs()}');
      //   print('a.dy: ${a.dy.abs()}');
      //   print('b.dy: ${b.dy.abs()}');
      //   color = Colors.green;
      // } else {

      if (a.dx > b.dx) {
        print('a.dx: ${a.dx.abs() - b.dx.abs()}');
        diff = a.dx.abs() - b.dx.abs();
      } else {
        diff = b.dx.abs() - a.dx.abs();
        print('b.dx: ${b.dx.abs() - a.dx.abs()}');
      }
      // print('a.dx: ${a.dx.abs()}');
      // print('b.dx: ${b.dx.abs()}');
      // print('a.dy: ${a.dy.abs()}');
      // print('b.dy: ${b.dy.abs()}');
      // }
      if (a.direction == b.direction) {
        print('nje');
      }
      if (diff > 50) {
        color = Colors.green;
      } else {
        color = Colors.blue;
      }
      Paint p = Paint()
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true
        ..color = color
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke;

      // print(a.direction);
      // print(b.direction);
      Rect rect = Rect.fromPoints(a, b);
      canvas.drawOval(rect, p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
