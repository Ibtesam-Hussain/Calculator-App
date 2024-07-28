import 'package:function_tree/function_tree.dart';

//just making and implementing rough logics here :)
void main() {
  String mathExp = '8%*2';
  String perc = '%';
  if (mathExp.contains(perc)) {
    String res = mathExp.replaceAll('%', '/ 100');
    print(res.interpret().toStringAsFixed(2)); //to show on UI,
  } else {
    print('false');
    print(mathExp.interpret().toStringAsFixed(4));
  }
}
