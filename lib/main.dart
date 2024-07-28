import 'package:auto_size_text/auto_size_text.dart';
import 'package:firstproject/Button_widgets/buttonWidgets.dart';
import 'package:firstproject/Button_widgets/specificButtons.dart';
import 'package:firstproject/Dropdown/dropdown.dart';
import 'package:firstproject/splash.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

void main() {
  //restricted to only potraitUp mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _expression = '';
  String _history = '';

  void clearAllAC(String numb) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clearC(String numb) {
    setState(() {
      _expression = _expression.substring(0, _expression.length - 1);
    });
  }

  void numClick(String numb) {
    setState(() {
      _expression += numb;
      //This line is for better UX (optional)
      _history = _expression;
    });
  }

  void solve(String numb) {
    try {
      setState(() {
        String percentage = '%';
        String divide = '/';
        String decimal = '.';
        if (_expression.contains(percentage) ||
            _expression.contains(divide) ||
            _expression.contains(decimal)) {
          String res = _expression.replaceAll(percentage, '/100');
          print(res);
          _history = _expression;
          res = '=${res.interpret().toStringAsFixed(6)}'; //to show on UI,
          _expression = res;
        } else {
          print('false');
          _history = _expression;
          _expression = '=${_expression.interpret().toStringAsFixed(0)}';
        }
      });
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              elevation: 20,
              shadowColor: Colors.black,
              content: Container(
                child: Text(
                  "Nothing Provided",
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              backgroundColor: Colors.black,
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My Calculator',
      //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      //   backgroundColor: Colors.amberAccent,
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(142, 142, 142, 1),
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(209, 209, 209, 1),
                          Color.fromRGBO(142, 142, 142, 1),
                        ]),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 50, left: 10, right: 10, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Calculator",
                          style: GoogleFonts.playfairDisplay(
                            textStyle: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      Dropdown(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  alignment: Alignment.bottomRight,
                  margin: const EdgeInsets.only(top: 67),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 12, bottom: 15, right: 15),
                        child: AutoSizeText(
                          _history,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black.withOpacity(0.7)),
                          minFontSize: 5,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 12, bottom: 25, right: 15),
                        child: AutoSizeText(
                          _expression,
                          style: const TextStyle(
                              fontSize: 48, color: Colors.black87),
                          minFontSize: 12,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.6,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 125, 111, 195),
                          Color.fromARGB(255, 64, 45, 114),
                        ]),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Buttonwidgets(
                            numb: 'AC',
                            callback: clearAllAC,
                          ),
                          Buttonwidgets(
                            numb: 'C',
                            callback: clearC,
                          ),
                          Buttonwidgets(
                            numb: '%',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '/',
                            callback: numClick,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Buttonwidgets(
                            numb: '7',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '8',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '9',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '*',
                            callback: numClick,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Buttonwidgets(
                            numb: '4',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '5',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '6',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '-',
                            callback: numClick,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Buttonwidgets(
                            numb: '1',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '2',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '3',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '+',
                            callback: numClick,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Buttonwidgets(
                            numb: '00',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '0',
                            callback: numClick,
                          ),
                          Buttonwidgets(
                            numb: '.',
                            callback: numClick,
                          ),
                          Specificbuttons(
                            equalsto: '=',
                            callback: solve,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   var name;
//   HomePage(this.name);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hello,",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//       ),
//       body: Center(
//         child: Container(
//           width: 100,
//           height: 100,
//           child: Text(
//             'Welcome, ${name}',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//           ),
//         ),
//       ),
//     );
//   }
// }
