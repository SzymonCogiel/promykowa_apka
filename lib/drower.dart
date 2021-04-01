import 'package:flutter/material.dart';
import 'package:promykowa_apka/homepage.dart';
import 'package:promykowa_apka/loginpage.dart';


class DrawerApear extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerApear>{


  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

  return ListView(
    children: <Widget>[
      new UserAccountsDrawerHeader( //funkcja do tworzenia uzytkownika
          accountName: new Text('Szymon'), //tutaj dac pozniej zmienną zamiast Tekstu
          accountEmail: new Text('szymi130801@gmail.com'), //tutaj dac pozniej zmienną zamiast Tekstu
        //currentAccountPicture: CircleAvatar(
          //child: Image.asset('images/zdjecieLegitymacyjne.jpg'), //naperawić problem jak wstawić tutaj zdjecie ale nie z internetu
        ) ,
      Column(children: <Widget>[
        RaisedButton(
          color: Theme.of(context).accentColor,
          // to jest mój sposób tez zadziałał color: Colors.deepPurple,
          textColor: Theme.of(context).primaryColorDark,
          child: Text(
            'Create account',
            style: textStyle,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Logowanie();}
            )
            );
          },
        ),
      ],
      )
    ],

  );
  }

}