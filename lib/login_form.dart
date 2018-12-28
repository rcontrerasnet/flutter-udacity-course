import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget{

@override
  LoginFormState createState(){
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm>{

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return 'Please enter some text!';
              }
            },
            decoration: InputDecoration(
              hintText: 'User Name'
            ),
          ),
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return 'Please enter some text!';
              }
            },
            decoration: InputDecoration(
              hintText: 'Password'
            ),
            obscureText: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                  Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Processing Data...')));
                }
              },
              child: Text('submit'),
            ),
          )
        ],
      ),
    );
  }

}