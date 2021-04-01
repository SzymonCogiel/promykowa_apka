import 'package:flutter/material.dart';
import 'package:promykowa_apka/homepage.dart';



class KalkulatorPromili extends StatefulWidget{
  @override
  _KalkulatorPromiliState createState() => _KalkulatorPromiliState();
}

class _KalkulatorPromiliState extends State<KalkulatorPromili>{

  int iloscAlcohl1=0;
  int wiek=0;
  int iloscAlcohl3=0;
  int iloscAlcohl5=0;
  double wzrost=1;
  double waga=1;
  var _sex = ['Male', 'Female'];

  var _currentSexSelected =
      '';
  var displayResult = '';

  void initState() {
    super.initState();
    _currentSexSelected = _sex[0];
  }

  void _onDropDownSexSelected(String newValueSelected) {
    setState(() {
      this._currentSexSelected = newValueSelected;
    });
  }

  TextEditingController wagaController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  int incrementer(){
    setState(() {
      iloscAlcohl1++;
    });
  }

  int incrementer2(){
    setState(() {
      iloscAlcohl3++;
    });
  }
  int incrementer3(){
    setState(() {
      iloscAlcohl5++;
    });
  }

  int incrementer4(){
    setState(() {
      wiek++;
    });
  }

  int decrementer(){
    setState(() {
      iloscAlcohl1--;
    });
  }
  int decrementer2(){
    setState(() {
      iloscAlcohl3--;
    });
  }
  int decrementer3(){
    setState(() {
      iloscAlcohl5--;
    });
  }
  int decrementer4(){
    setState(() {
      wiek--;
    });
  }

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('KALKULATOR PROMILI'),
        ),
    backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent])
                      .createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset('images/drinkss.png',
                    height: 300.0, fit: BoxFit.cover)),
            Column(
              children: <Widget>[
                Text('HOW DOES THE CALCULATOR WORK?',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child:Row(children: <Widget>[
                  Icon(Icons.height,color: Colors.white,size: 30,),
                  Text('Enter height:',
                    style: TextStyle(
                      color: Colors.white, fontSize: 20
                    ),
                  ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 10.0),
                      child: Container(
                          width: 90.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: textStyle,
                            controller: heightController,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Enter height';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'Height',
                                hintText: 'cm',
                                labelStyle: textStyle,
                                errorStyle: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontSize: 10.0,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          )),
                    ),
                ],
                ),),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Row(children: <Widget>[
                  Icon(Icons.line_weight,color: Colors.white,size: 30,),
                  Text('Enter weight:',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 10.0),
                      child: Container(
                        width: 90.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white
                          ),
                          child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: wagaController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Enter weight';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Weight:',
                            hintText: 'kg',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 10.0,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                  ),
                ],
                ),),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child:Row(children: <Widget>[
                    Icon(Icons.person_rounded,color: Colors.white,size: 30,),
                    Text('Enter age:',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: FittedBox(
                        child:new FloatingActionButton(
                          heroTag: "btn3",
                          onPressed: decrementer4,
                          child: Icon(Icons.remove,color: Colors.black,),backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 0.0, right: 10.0),
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white //color: Colors.white ale wtedy trzeba tez zmienic kolor czciąki
                      ),
                      // child: Padding(
                      //   padding: EdgeInsets.only(bottom: 25.0,top:15.0, left: 25),
                      child: Center(
                        child: Text('$wiek',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
                      // ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: FittedBox(
                        child:new FloatingActionButton(
                          heroTag: "btn4",
                          onPressed: incrementer4,
                          child: Icon(Icons.add,color: Colors.black,),backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  ),),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child:Row(children: <Widget>[
                  Icon(Icons.sports_bar,color: Colors.white,size: 30,),
                  Text('Beer:',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20
                    ),
                  ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: FittedBox(
                        child:new FloatingActionButton(
                          heroTag: "btn1",
                          onPressed: decrementer,
                      child: Icon(Icons.remove,color: Colors.black,),backgroundColor: Colors.white,
                    ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 0.0, right: 10.0),
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white //color: Colors.white ale wtedy trzeba tez zmienic kolor czciąki
                      ),
                           // child: Padding(
                           //   padding: EdgeInsets.only(bottom: 25.0,top:15.0, left: 25),
                             child: Center(
                               child: Text('$iloscAlcohl1',
                                 style: TextStyle(color: Colors.black, fontSize: 30),
                               ),
                             ),
                           // ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: FittedBox(
                        child:new FloatingActionButton(
                          heroTag: "btn2",
                          onPressed: incrementer,
                          child: Icon(Icons.add,color: Colors.black,),backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                ],
                ),),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child:Row(children: <Widget>[
                    Icon(Icons.wine_bar_sharp,color: Colors.white,size: 30,),
                    Text('Wine 200 ml:',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: FittedBox(
                        child:new FloatingActionButton(
                          heroTag: "btn5",
                          onPressed: decrementer2,
                          child: Icon(Icons.remove,color: Colors.black,),backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 0.0, right: 10.0),
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white //color: Colors.white ale wtedy trzeba tez zmienic kolor czciąki
                      ),
                      // child: Padding(
                      //   padding: EdgeInsets.only(bottom: 25.0,top:15.0, left: 25),
                      child: Center(
                        child: Text('$iloscAlcohl3',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
                      // ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: FittedBox(
                        child:new FloatingActionButton(
                          heroTag: "btn6",
                          onPressed: incrementer2,
                          child: Icon(Icons.add,color: Colors.black,),backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  ),),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child:Row(children: <Widget>[
                    Icon(Icons.local_bar,color: Colors.white,size: 30,),
                    Text('Alc. 40% 40 ml:',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: FittedBox(
                        child:new FloatingActionButton(
                          heroTag: "btn7",
                          onPressed: decrementer3,
                          child: Icon(Icons.remove,color: Colors.black,),backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      //padding: EdgeInsets.only(left: 0.0, right: 10.0),
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white //color: Colors.white ale wtedy trzeba tez zmienic kolor czciąki
                      ),
                      // child: Padding(
                      //   padding: EdgeInsets.only(bottom: 25.0,top:15.0, left: 25),
                      child: Center(
                        child: Text('$iloscAlcohl5',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
                      // ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: FittedBox(
                        child:new FloatingActionButton(
                          heroTag: "btn8",
                          onPressed: incrementer3,
                          child: Icon(Icons.add,color: Colors.black,),backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  ),),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
              child:Row(children: <Widget>[
                Icon(Icons.sentiment_very_satisfied,color: Colors.white,size: 30,),
                Text('Sex:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  height: 40.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white
                  ),
                  child: FittedBox(
                      child: DropdownButton<String>(
                        items: _sex.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),

                        value: _currentSexSelected,

                        onChanged: (String newValueSelected) {
                          _onDropDownSexSelected(newValueSelected);
                        },
                      )
                  ),
                ),
              ],
              ),),
            Column(children: <Widget>[
              RaisedButton(
                color: Theme.of(context).primaryColorLight,
                textColor: Theme.of(context).primaryColorDark,
                child: Text(
                  'CALCULATE',
                  style: textStyle,
                ),
                onPressed: () {
                  setState(() {
                      this.displayResult = _calculateTotalReturns();
                  });
                },
              ),
            ],
            ),
        Text(
          this.displayResult,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),


          ],

        ),
      )
    );
  }
  String _calculateTotalReturns() {
    double waga = double.parse(wagaController.text);
    double alc;
    double wspol;
    if(_sex=='Female'){
      wspol=0.55;
    }else{
      wspol=0.68;
    }
    alc=iloscAlcohl1*18+iloscAlcohl3*19.2+iloscAlcohl5*12.8;


    double totalAlcoholInBoold = (alc/(waga*wspol));//*100;

    String result =
        'You have $totalAlcoholInBoold per mille';
    return result;
  }
}

