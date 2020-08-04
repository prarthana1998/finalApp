import 'package:flutter/material.dart';
import 'data_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:validators/validators.dart' as validator;
import 'package:firebase_core/firebase_core.dart';

//void main() => runApp(MyApp());

class MyFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Feedback Form'),
          centerTitle: true,
        ),
        body: TestForm(),
      ),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final fb = FirebaseDatabase.instance;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final descriptionController = TextEditingController();
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  int _radioValue3 = -1;
  int _radioValue4 = -1;
  int _radioValue5 = -1;
  int _radioValue6 = -1;
  int _radioValue7 = -1;
  Model model = Model();


  void _handleRadioValueChanged1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          model.ques1='Strongly agree';
          break;
        case 1:
          model.ques1='agree';
          break;
        case 2:
          model.ques1='Strongly disagree';
          break;
        case 3:
          model.ques1='disagree';
          break;
        case 4:
          model.ques1='neither nor';
          break;
      }
    });
  }
  void _handleRadioValueChanged2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          model.ques2='Strongly agree';
          break;
        case 1:
          model.ques2='agree';
          break;
        case 2:
          model.ques2='Strongly disagree';
          break;
        case 3:
          model.ques2='disagree';
          break;
        case 4:
          model.ques2='neither nor';
          break;
      }
    });
  }
  void _handleRadioValueChanged3(int value) {
    setState(() {
      _radioValue3 = value;

      switch (_radioValue3) {
        case 0:
          model.ques3='Strongly agree';
          break;
        case 1:
          model.ques3='agree';
          break;
        case 2:
          model.ques3='Strongly disagree';
          break;
        case 3:
          model.ques3='disagree';
          break;
        case 4:
          model.ques3='neither nor';
          break;
      }
    });
  }
  void _handleRadioValueChanged4(int value) {
    setState(() {
      _radioValue4 = value;

      switch (_radioValue4) {
        case 0:
          model.ques4='Strongly agree';
          break;
        case 1:
          model.ques4='agree';
          break;
        case 2:
          model.ques4='Strongly disagree';
          break;
        case 3:
          model.ques4='disagree';
          break;
        case 4:
          model.ques4='neither nor';
          break;
      }
    });
  }
  void _handleRadioValueChanged5(int value) {
    setState(() {
      _radioValue5 = value;

      switch (_radioValue5) {
        case 0:
          model.ques5='Strongly agree';
          break;
        case 1:
          model.ques5='agree';
          break;
        case 2:
          model.ques5='Strongly disagree';
          break;
        case 3:
          model.ques5='disagree';
          break;
        case 4:
          model.ques5='neither nor';
          break;
      }
    });
  }
  void _handleRadioValueChanged6(int value) {
    setState(() {
      _radioValue6 = value;

      switch (_radioValue6) {
        case 0:
          model.ques6='Strongly agree';
          break;
        case 1:
          model.ques6='agree';
          break;
        case 2:
          model.ques6='Strongly disagree';
          break;
        case 3:
          model.ques6='disagree';
          break;
        case 4:
          model.ques6='neither nor';
          break;
      }
    });
  }
  void _handleRadioValueChanged7(int value) {
    setState(() {
      _radioValue7 = value;

      switch (_radioValue7) {
        case 0:
          model.ques7='Strongly agree';
          break;
        case 1:
          model.ques7='agree';
          break;
        case 2:
          model.ques7='Strongly disagree';
          break;
        case 3:
          model.ques7='disagree';
          break;
        case 4:
          model.ques7='neither nor';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Full Name'),
            controller: nameController,
            keyboardType: TextInputType.text,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter your first name';
              }
              return null;
            },
          ),
          TextFormField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
              controller: phoneController,
              keyboardType: TextInputType.phone,
              validator: (String value) {
                if (value.length != 10)
                  return 'Mobile Number must be of 10 digit';
                else
                  return null;
              }),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (String value) {
              if (!validator.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 15.0),
          Column(
            children: <Widget>[
              Text('1. This workshop/training lived up to your expectations:',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChanged1,
                  ),
                  Text('Strongly Agree'),
                  Radio(
                    value: 1,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChanged1,
                  ),
                  Text('Agree'),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChanged1,
                  ),
                  Text(
                      'Disagree'
                  ),
                  Radio(
                    value: 3,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChanged1,
                  ),
                  Text(
                      'Strongly Disagree'
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 4,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChanged1,
                  ),
                  Text('Neither agree nor disagree'),
                ],
              ),
              SizedBox(height: 15.0,),
              Text('2. The content used is relevant to your field of work:',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue2,
                    onChanged: _handleRadioValueChanged2,
                  ),
                  Text('Strongly Agree'),
                  Radio(
                    value: 1,
                    groupValue: _radioValue2,
                    onChanged: _handleRadioValueChanged2,
                  ),
                  Text('Agree'),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _radioValue2,
                    onChanged: _handleRadioValueChanged2,
                  ),
                  Text(
                      'Disagree'
                  ),
                  Radio(
                    value: 3,
                    groupValue: _radioValue2,
                    onChanged: _handleRadioValueChanged2,
                  ),
                  Text(
                      'Strongly Disagree'
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 4,
                    groupValue: _radioValue2,
                    onChanged: _handleRadioValueChanged2,
                  ),
                  Text('Neither agree nor disagree'),
                ],
              ),
              SizedBox(height: 15.0,),
              Text('3. The material provided was enough to understand the concept:',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue3,
                    onChanged: _handleRadioValueChanged3,
                  ),
                  Text('Strongly Agree'),
                  Radio(
                    value: 1,
                    groupValue: _radioValue3,
                    onChanged: _handleRadioValueChanged3,
                  ),
                  Text('Agree'),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _radioValue3,
                    onChanged: _handleRadioValueChanged3,
                  ),
                  Text(
                      'Disagree'
                  ),
                  Radio(
                    value: 3,
                    groupValue: _radioValue3,
                    onChanged: _handleRadioValueChanged3,
                  ),
                  Text(
                      'Strongly Disagree'
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 4,
                    groupValue: _radioValue3,
                    onChanged: _handleRadioValueChanged3,
                  ),
                  Text('Neither agree nor disagree'),
                ],
              ),
              SizedBox(height: 15.0,),
              Text('4. The workshop activities stimulated my learning:',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue4,
                    onChanged: _handleRadioValueChanged4,
                  ),
                  Text('Strongly Agree'),
                  Radio(
                    value: 1,
                    groupValue: _radioValue4,
                    onChanged: _handleRadioValueChanged4,
                  ),
                  Text('Agree'),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _radioValue4,
                    onChanged: _handleRadioValueChanged4,
                  ),
                  Text(
                      'Disagree'
                  ),
                  Radio(
                    value: 3,
                    groupValue: _radioValue4,
                    onChanged: _handleRadioValueChanged4,
                  ),
                  Text(
                      'Strongly Disagree'
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 4,
                    groupValue: _radioValue4,
                    onChanged: _handleRadioValueChanged4,
                  ),
                  Text('Neither agree nor disagree'),
                ],
              ),
              SizedBox(height: 15.0,),
              Text('5. The activities in workshop gave me sufficient practice and feedback:',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue5,
                    onChanged: _handleRadioValueChanged5,
                  ),
                  Text('Strongly Agree'),
                  Radio(
                    value: 1,
                    groupValue: _radioValue5,
                    onChanged: _handleRadioValueChanged5,
                  ),
                  Text('Agree'),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _radioValue5,
                    onChanged: _handleRadioValueChanged5,
                  ),
                  Text(
                      'Disagree'
                  ),
                  Radio(
                    value: 3,
                    groupValue: _radioValue5,
                    onChanged: _handleRadioValueChanged5,
                  ),
                  Text(
                      'Strongly Disagree'
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 4,
                    groupValue: _radioValue5,
                    onChanged: _handleRadioValueChanged5,
                  ),
                  Text('Neither agree nor disagree'),
                ],
              ),
              SizedBox(height: 15.0,),
              Text('6. The instructors were well prepared and helpful:',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue6,
                    onChanged: _handleRadioValueChanged6,
                  ),
                  Text('Strongly Agree'),
                  Radio(
                    value: 1,
                    groupValue: _radioValue6,
                    onChanged: _handleRadioValueChanged6,
                  ),
                  Text('Agree'),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _radioValue6,
                    onChanged: _handleRadioValueChanged6,
                  ),
                  Text(
                      'Disagree'
                  ),
                  Radio(
                    value: 3,
                    groupValue: _radioValue6,
                    onChanged: _handleRadioValueChanged6,
                  ),
                  Text(
                      'Strongly Disagree'
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 4,
                    groupValue: _radioValue6,
                    onChanged: _handleRadioValueChanged6,
                  ),
                  Text('Neither agree nor disagree'),
                ],
              ),
              SizedBox(height: 15.0,),
              Text('7. I will be able to make real-life project from what I learned in the workshop:',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue7,
                    onChanged: _handleRadioValueChanged7,
                  ),
                  Text('Strongly Agree'),
                  Radio(
                    value: 1,
                    groupValue: _radioValue7,
                    onChanged: _handleRadioValueChanged7,
                  ),
                  Text('Agree'),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _radioValue7,
                    onChanged: _handleRadioValueChanged7,
                  ),
                  Text(
                      'Disagree'
                  ),
                  Radio(
                    value: 3,
                    groupValue: _radioValue7,
                    onChanged: _handleRadioValueChanged7,
                  ),
                  Text(
                      'Strongly Disagree'
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 4,
                    groupValue: _radioValue7,
                    onChanged: _handleRadioValueChanged7,
                  ),
                  Text('Neither agree nor disagree'),
                ],
              )
            ],
          ),
          SizedBox(height: 15.0,),
          Text('8. What other improvements would you recommend in this workshop?',
            style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0,
            ),
          ),
          TextField(
              maxLines: 10,
              controller: descriptionController ,
              decoration: InputDecoration(
                hintText: "Enter a message",
                //fillColor: Colors.grey[300],
                filled: true,
              )
          ),
          RaisedButton(
            child: Text('Submit'),
            color: Colors.lightBlueAccent,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                ref.push().set({
                  'name': nameController.text,
                  'phone': phoneController.text,
                  'email': emailController.text,
                  'ques1': model.ques1,
                  'ques2':model.ques2,
                  'ques3': model.ques3,
                  'ques4':model.ques4,
                  'ques5':model.ques5,
                  'ques6':model.ques6,
                  'ques7':model.ques7,
                  'ques8':descriptionController.text,
                });
                nameController.text = '';
                phoneController.text = '';
                emailController.text = '';
                descriptionController.text='';
                _handleRadioValueChanged1(-1);
                _handleRadioValueChanged2(-1);
                _handleRadioValueChanged3(-1);
                _handleRadioValueChanged4(-1);
                _handleRadioValueChanged5(-1);
                _handleRadioValueChanged6(-1);
                _handleRadioValueChanged7(-1);
              }
              else{

              }
              showAlertDialog(context);
            },
          )
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Thankyou for the Feedback!"),
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
