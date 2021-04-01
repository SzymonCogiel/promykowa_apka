import 'package:flutter/material.dart';
import 'package:promykowa_apka/homepage.dart';

class Logowanie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogowanieFormState();
  }
}

class _LogowanieFormState extends State<Logowanie> {

  var _formKey = GlobalKey<FormState>();

  var _sex = ['Male', 'Female'];
  final double _minimumPadding = 5.0;
  bool _sprawdzacz= true;

  var _currentSexSelected =
      '';

  @override
  void initState() {
    super.initState();
    _currentSexSelected = _sex[0];
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController yearController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Create account'),
      ),

      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(_minimumPadding * 2),
            child: ListView(
              children: <Widget>[
                getImageAsset(),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      style: textStyle,
                      controller: emailController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter correct email';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'email',
                          hintText: 'Enter email np. 0nder@agh.edu.pl',
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: pinController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter PIN';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'PIN',
                          hintText: 'PIN',
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: textStyle,
                              controller: yearController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please enter birthday year in years';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Year of birth',
                                  hintText: 'Year in years',
                                  labelStyle: textStyle,
                                  errorStyle: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 15.0
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0))),
                            )),
                        Container(
                          width: _minimumPadding * 5,
                        ),
                        Expanded(
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
                            ))
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: _minimumPadding, top: _minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColorDark,
                            child: Text(
                              'Create account',
                              style: textStyle,
                            ),
                            onPressed: () { if(_sprawdzacz){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return HomePage();}
                                )
                              );}
                            },
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Reset',
                              style: textStyle,
                            ),
                            onPressed: () {
                              setState(() {
                                _reset();
                              });
                            },
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(_minimumPadding * 2),
                  child: Text(
                    "SKIP",
                    style: textStyle,
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/xdagh.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _onDropDownSexSelected(String newValueSelected) {
    setState(() {
      this._currentSexSelected = newValueSelected;
    });
  }

  void _reset() {
    emailController.text = '';
    pinController.text = '';
    yearController.text = '';
    _currentSexSelected = _sex[0];
  }
}