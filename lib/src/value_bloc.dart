import 'package:bloc_pattern/bloc_pattern.dart';

class ValueBloc extends BlocBase {
  double value = 0.0;

  onChangeValue(double v) {
    value = v;
    notifyListeners();
  }

}
