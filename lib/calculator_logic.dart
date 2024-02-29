class CalculatorLogic {
  double _currentValue = 0;
  double _bufferValue = 0;
  String _operation = '';

  void applyDigit(String digit) {
    if (_currentValue == 0 && digit != '0') {
      _currentValue = double.parse(digit);
    } else if (_currentValue != 0) {
      _currentValue = double.parse(_currentValue.toString() + digit);
    }
  }

  void applyOperation(String operation) {
    if (_operation.isNotEmpty) {
      _compute();
    } else {
      _bufferValue = _currentValue;
      _currentValue = 0;
    }
    _operation = operation;
  }

  void _compute() {
    switch (_operation) {
      case '+':
        _currentValue = _bufferValue + _currentValue;
        break;
      case '-':
        _currentValue = _bufferValue - _currentValue;
        break;
      case '*':
        _currentValue = _bufferValue * _currentValue;
        break;
      case '/':
        if (_currentValue != 0) {
          _currentValue = _bufferValue / _currentValue;
        }
        break;
    }
  }

  void clear() {
    _currentValue = 0;
    _bufferValue = 0;
    _operation = '';
  }

  double getResult() {
    _compute();
    return _currentValue;
  }
}
