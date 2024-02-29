import 'package:flutter/material.dart';
import 'calculator_logic.dart';

class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  CalculatorLogic _calculatorLogic = CalculatorLogic();
  String _input = '';

  Widget _buildButton(String text, {Function()? onPressed, Color? color}) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color ?? Colors.white),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _input,
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('7', onPressed: () => _updateInput('7'), color: Colors.blue),
              _buildButton('8', onPressed: () => _updateInput('8'), color: Colors.blue),
              _buildButton('9', onPressed: () => _updateInput('9'), color: Colors.blue),
              _buildButton(
                '/',
                onPressed: () => _applyOperation('/'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              _buildButton('4', onPressed: () => _updateInput('4'), color: Colors.blue),
              _buildButton('5', onPressed: () => _updateInput('5'), color: Colors.blue),
              _buildButton('6', onPressed: () => _updateInput('6'), color: Colors.blue),
              _buildButton(
                '*',
                onPressed: () => _applyOperation('*'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              _buildButton('1', onPressed: () => _updateInput('1'), color: Colors.blue),
              _buildButton('2', onPressed: () => _updateInput('2'), color: Colors.blue),
              _buildButton('3', onPressed: () => _updateInput('3'), color: Colors.blue),
              _buildButton(
                '-',
                onPressed: () => _applyOperation('-'),
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              _buildButton('C', onPressed: _clearInput, color: Colors.red),
              _buildButton('0', onPressed: () => _updateInput('0'), color: Colors.blue),
              _buildButton('=', onPressed: _calculate, color: Colors.green),
              _buildButton(
                '+',
                onPressed: () => _applyOperation('+'),
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateInput(String value) {
    setState(() {
      _input += value;
      _calculatorLogic.applyDigit(value);
    });
  }

  void _clearInput() {
    setState(() {
      _input = '';
      _calculatorLogic.clear();
    });
  }

  void _applyOperation(String operation) {
    setState(() {
      _input += operation;
      _calculatorLogic.applyOperation(operation);
    });
  }

  void _calculate() {
    setState(() {
      _input = _calculatorLogic.getResult().toString();
    });
  }
}

