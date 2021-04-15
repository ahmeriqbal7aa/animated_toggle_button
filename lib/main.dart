import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool toggleValue = false;

  //TODO Create Toggle Button Function
  toggleButton() {
    setState(() {
      toggleValue = !toggleValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          height: 40.0,
          width: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: toggleValue
                ? Colors.greenAccent[200]
                : Colors.redAccent[200].withOpacity(0.4),
          ),
          child: Stack(
            children: [
              //TODO Rotation_Animation
              AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                left: toggleValue ? 60.0 : 0.0,
                right: toggleValue ? 0.0 : 60.0,
                top: 3.0,
                child: InkWell(
                  onTap: toggleButton,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 1000),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return RotationTransition(child: child, turns: animation);
                      // for scale transition
                      //return ScaleTransition(child: child, scale: animation);
                    },
                    // what to toggle is defined below
                    child: toggleValue
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 35.0,
                            // key used to tell the switcher that
                            // these are two separate widget(Icon())
                            key: UniqueKey(),
                          )
                        : Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                            size: 35.0,
                            // key used to tell the switcher that
                            // these are two separate widget(Icon())
                            key: UniqueKey(),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
