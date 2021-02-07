import 'package:flutter/material.dart';

class InputBlock extends StatelessWidget {
  const InputBlock(
      this._fieldName, this._initialValue, this._inputSymbol, this._callback);

  // Name of the input field
  final String _fieldName;

  // value to initialize with, when the app is first launched
  final double _initialValue;

  // symbol to show beside the input field, $ or %
  final String _inputSymbol;

  // this stores the callback function which is called when input is detected on the text field
  final Function(String) _callback;

  @override
  Widget build(BuildContext context) {
    final InputDecoration inputDecoration = InputDecoration(
      fillColor: Theme.of(context).inputDecorationTheme.fillColor,
      filled: Theme.of(context).inputDecorationTheme.filled,
      focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
      enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
    );
    return Container(
      height: 110,
      width: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        color: Theme.of(context).accentColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 4,
            offset: const Offset(5, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 12),
            child: Text(
              _fieldName,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Row(
              children: <Widget>[
                Text(_inputSymbol,
                    style: Theme.of(context).textTheme.headline4),
                const Spacer(),
                Flexible(
                    child: Container(
                  margin: const EdgeInsets.only(right: 10, left: 40),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    initialValue: _initialValue.toString(),
                    onChanged: (String text) {
                      _callback(text);
                    },
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(
                        fontSize: 16.0, height: 1, color: Colors.white),
                    decoration: inputDecoration,
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
