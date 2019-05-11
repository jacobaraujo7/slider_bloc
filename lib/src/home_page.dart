import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:provider_test/src/value_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Widget _textValue(double v) {
    return Text(
      "Value: ${v.toStringAsPrecision(1)}",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("reconstruindo");

    ValueBloc valueBloc = BlocProvider.getBloc<ValueBloc>();

    return Material(
      color: Color.lerp(Colors.red, Colors.purple, valueBloc.value),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<ValueBloc>(
            builder: (BuildContext context, ValueBloc valueBloc) {
              return _textValue(valueBloc.value);
            },
          ),
          Container(
            height: 25,
          ),
          Consumer<ValueBloc>(
            builder: (BuildContext context, ValueBloc valueBloc) {
              return Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              min: 0.0,
              max: 1.0,
              onChanged: valueBloc.onChangeValue,
              value: valueBloc.value);
            },
          ),
          
        ],
      ),
    );
  }
}
