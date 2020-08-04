import 'package:flutter/material.dart';
import 'package:dashboard/thingspeak/model/data_model.dart';
import 'package:dashboard/thingspeak/services/network.dart';
import 'package:dashboard/thingspeak/constant.dart';
import 'dart:convert';
import 'package:dashboard/thingspeak/services/database_services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class WriteForm extends StatefulWidget {
  @override
  _WriteFormState createState() => _WriteFormState();
}

class _WriteFormState extends State<WriteForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  Model model = Model();
  NetworkService _networkService = NetworkService();
  DatabaseService _databaseService = DatabaseService();

  String writeKey;

  void extractCredentials() async {
    var mwriteKey = await _databaseService.getWriteKey();
    setState(() {
      print(mwriteKey);
      writeKey = mwriteKey;
    });
    // print(writeKey);
  }

  @override
  void initState() {
    extractCredentials();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Container(
          child: Form(
              key: _formKey,
              child: Center(
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    MyTextFormField(
                      hintText: 'Field Id',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter Field id';
                        }
                        return null;
                      },
                      onChange: (value) {
                        model.field = value;
                      },
                    ),
                    SizedBox(height: 20.0),
                    MyTextFormField(
                      hintText: 'Enter Data Value',
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'First enter Data Value';
                        }
                        return null;
                      },
                      onChange: (value) {
                        model.data = value;
                      },
                    ),
                    SizedBox(height: 20.0),
                    FlatButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        //write call function
                        debugPrint('Data added ');
                        var response = await _networkService.writeInField(
                            writeKey: writeKey,
                            fieldValue: model.field,
                            data: model.data);

                        if (response != null) {
                          print('response: $response');
                          var recData = jsonDecode(response);
                          model.response = recData;
                          showAlertDialog(context, res: model.response);
                          //debugPrint('Response is : $recData');
                          setState(() {
                            _isLoading = false;
                          });
                        } else {
                          print('response error');
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(18.0),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Text(
                          'Write',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                ))),
    );
  }

  void showAlertDialog(BuildContext context, {var res}) {
    // set up the button
    Widget homeButton = FlatButton(
      child: Text("Home"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.pushNamed(context, '/home');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Entry Added!"),
      content: Text("Entry id: $res "),
      actions: [
        homeButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onChange;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.all(15.0),
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[200],
      ),
      validator: validator,
      onChanged: onChange,
    );
  }
}
