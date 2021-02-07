import 'package:flutter/material.dart';
import 'package:tipcalc/ui/widgets/input_block.dart';
import 'package:tipcalc/ui/widgets/output_line_item.dart';

class CalculateTipScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CalculateTipScreenState();
}

class _CalculateTipScreenState extends State<CalculateTipScreen> {
  // This is the default bill amount
  static const double defaultBillAmount = 0.0;

  // This is the default tip percentage
  static const double defaultTipPercentage = 15.0;

  // This stores the latest value of bill amount calculated
  double _billAmount = defaultBillAmount;

  // This stores the latest value of tip percentage calculated
  double _tipPercentage = defaultTipPercentage;

  void _onBillAmountChanged(String text) {
    setState(() {
      _billAmount = double.tryParse(text) ?? 0.0;
    });
  }

  void _onTipAmountChanged(String text) {
    setState(() {
      _tipPercentage = double.tryParse(text) ?? 0.0;
    });
  }

  double _getTipAmount() => _billAmount * _tipPercentage / 100;

  double _getTotalAmount() => _billAmount + _getTipAmount();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Tip Calculator',
          style: TextStyle(fontSize: 30),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InputBlock('Bill Amount', _billAmount, r'$', _onBillAmountChanged),
            InputBlock(
                'Tip Percentage', _tipPercentage, '%', _onTipAmountChanged),
            Container(
              height: 250,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 28, top: 16, bottom: 15),
                    child: Text(
                      'Bill Details',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 5,
                  ),
                  const SizedBox(
                    height: 47,
                  ),
                  OutputLineItem('Tip Amount', _getTipAmount()),
                  const SizedBox(
                    height: 35,
                  ),
                  OutputLineItem('Total Bill', _getTotalAmount()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
