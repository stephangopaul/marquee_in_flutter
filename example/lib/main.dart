import 'package:flutter/cupertino.dart';
import 'package:marquee_in_flutter/marquee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: _RootWidget()
    );
  }
}

class _RootWidget extends StatelessWidget {

  var _textStyle = TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.bold, fontSize: 50);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ScrollMarquee(
                items: [
                  Image.asset("images/puppy.jpg", width: 100, height: 100),
                  Text(" Hello Flutter ", style: _textStyle)
                ],
                speed: Speed.slow,
            ),
          ),
          SizedBox(
            width: 300,
            height: 100,
            child: AlternateMarquee(
                items: [
                  Image.asset("images/puppy.jpg", width: 50, height: 50),
                  SizedBox(width: 10),
                  Text("🐶 Puppy 🐶", style: _textStyle),
                  SizedBox(width: 10),
                  Image.asset("images/puppy.jpg", width: 50, height: 50)
                ],
              speed: Speed.fast,
            ),
          )
        ],
      ),
    );
  }
}