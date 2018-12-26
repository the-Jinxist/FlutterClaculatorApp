import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyAppState();
  }

}

class MyAppState extends State<MyApp>{

  var num1, num2, answer;
  final controller1 = new TextEditingController(text: "0");
  final controller2 = new TextEditingController(text: "0");

  void doAddition(){
    setState(() {
      num1 = int.parse(controller1.text);
      num2 = int.parse(controller2.text);

      answer = num1 + num2;
      controller1.text = "$answer";
      controller2.text = "0";
    });
  }

  void doSubtraction(){
    setState(() {
      num1 = int.parse(controller1.text);
      num2 = int.parse(controller2.text);

      answer = num1 - num2;
      controller1.text = "$answer";
      controller2.text = "0";
    });
  }

  void doDivision(){
    setState(() {
      num1 = int.parse(controller1.text);
      num2 = int.parse(controller2.text);

      answer = num1 / num2;
      controller1.text = "$answer";
      controller2.text = "0";
    });
  }

  void doMultiplication(){
    setState(() {
      num1 = int.parse(controller1.text);
      num2 = int.parse(controller2.text);

      answer = num1 * num2;
      controller1.text = "$answer";
      controller2.text = "0";
    });
  }

  final FocusNode focusNode =  new FocusNode();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: new ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.amber
      ),
      title: "Calculator App",
      home: new Material(

        child: new Scaffold(
          appBar: new AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: new Text("Calculate!",
                style: new TextStyle(color: Colors.black, fontSize: 20.0, fontStyle: FontStyle.normal, ),
              
            ),
          ),
          body: new Container(
            padding: new EdgeInsets.all(20.0),
            color: Colors.white,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new TextField(

                  controller: controller1,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.end,
                  decoration: new InputDecoration(
                      labelText: "Please enter your first number here",
                      border: new OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10.0))
                  ),
                  maxLines: 1,
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new TextField(
                  controller: controller2,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.end,
                  decoration: new InputDecoration(
                    labelText: "Please enter your second number here",
                    border: new OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10.0))
                  ),
                  maxLines: 1,
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new FloatingActionButton(onPressed: (){
                          doAddition();
                        }, child: new Icon(Icons.add, color: Colors.white,), backgroundColor: Colors.amber,

                        ),
                        new Padding(padding: EdgeInsets.all(5.0)),
                        new FloatingActionButton(onPressed: (){
                          doSubtraction();
                        },

                          child: new Icon(Icons.details, color: Colors.white,),
                          backgroundColor: Colors.red,

                        ),
                        new Padding(padding: EdgeInsets.all(5.0)),
                        new FloatingActionButton(onPressed: (){
                            doMultiplication();
                        },

                          child: new Icon(Icons.star, color: Colors.white,),
                          backgroundColor: Colors.blue,

                        ),
                        new Padding(padding: EdgeInsets.all(5.0)),
                        new FloatingActionButton(onPressed: (){
                            doDivision();
                        },

                          child: new Icon(Icons.turned_in, color: Colors.white,),
                          backgroundColor: Colors.deepOrange,

                        ),

                      ],
                    )
                  ],
                )
              ],
            )
          ) ,
        ),
      ),
    );
  }
}