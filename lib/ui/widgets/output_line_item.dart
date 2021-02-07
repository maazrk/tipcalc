import 'package:flutter/material.dart';

class OutputLineItem extends StatelessWidget {
  const OutputLineItem(this._labelName, this._outputValue);

  // label name for the output line item
  final String _labelName;

  // Value to be shown in the output line item
  final double _outputValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 10),
      child: Row(
        children: <Widget>[
          Text(
            _labelName,
            style: Theme.of(context).textTheme.headline4,
          ),
          const Spacer(),
          Text(
            ' \$ $_outputValue ',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
