import 'package:flutter/material.dart';
import 'package:promykowa_apka/drower.dart';
import 'package:promykowa_apka/kalkulatorpromili.dart';
import 'package:promykowa_apka/loginpage.dart';
import 'package:promykowa_apka/maps.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 1200, //wysokosc kontenera
              ),
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
                  child: Image.asset('images/promyknoca.jpg',
                      height: 300.0, fit: BoxFit.cover)),
              RotatedBox(
                quarterTurns: 3,
                child: Text('DS 12',
                    style: TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.3),
                        letterSpacing: 10.0)),
              ),
              Positioned(
                top: 4.0,
                right: 4.0,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white),
                  child: Center(
                    child: Icon(Icons.menu),
                  ),
                ),
              ),
              Positioned(
                top: 2.0,
                right: 5.0,
                child: Container(
                  height: 12.0,
                  width: 12.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Color(0xFFFD3664)),
                ),
              ),
              Positioned(
                  top: 245.0,
                  left: 40.0,
                  child: Column(
                    children: <Widget>[
                      Text('WELCOME TO',
                          style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 32.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))
                    ],
                  )),
              Positioned(
                  top: 280.0,
                  left: 40.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('PROMYK',
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFD3664))),
                          Text(',',
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(width: 10.0),
                          Text('CRACOW',
                              style: TextStyle(
                                  fontFamily: 'Oswald',
                                  fontSize: 50.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  )),
              Positioned(
                  top: 380.0,
                  left: 0.0,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 260.0,
                        width: 400.0,
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                    image: AssetImage('images/drinkss.png'),
                                    fit: BoxFit.cover
                                )
                                // color: Colors.white
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return KalkulatorPromili();
                            }));
                          },
                        ),
                      ),
                    ],
                  )
                  ),
              Positioned(
                  top: 650.0,
                  left: 0.0,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 260.0,
                        width: 400.0,
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                    image: AssetImage('images/wykladowcy.png'),
                                    fit: BoxFit.cover
                                ),
                            ),
                          ),
                          onTap: (){
                            alertComingSoon(context);
                          },
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  top: 920.0,
                  left: 0.0,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 260.0,
                        width: 400.0,
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                    image: AssetImage('images/promykMapsss.png'),
                                    fit: BoxFit.cover
                                ),
                                color: Colors.white
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return MapaMiasteczkaPage();
                            }));
                          },
                        ),
                      ),
                    ],
                  )
                  )
            ],
          )
        ],
      ),
      drawer: Drawer( child: DrawerApear()),
    );
  }
}

void alertComingSoon(BuildContext context){
  var alertDialog=AlertDialog(
    title: Text("Upps sorry"),
    content: Text("Available in shortcut"),
  );
  showDialog( //metoda wyswietlająca zmienna alertDialog
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
  );
}