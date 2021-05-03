import 'package:flutter/cupertino.dart';
import 'speed.dart';

class ScrollMarquee extends StatefulWidget {

  final List<Widget> items;
  final Speed speed;

  ScrollMarquee({
    Key key,
    @required this.items,
    this.speed = Speed.normal
  }): super(key: key);

  @override
  _ScrollMarqueeState createState() => _ScrollMarqueeState();
}

class _ScrollMarqueeState extends State<ScrollMarquee> {

  ScrollController _scrollController;
  double _position = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.doWhile(_scroll);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: widget.items[index % widget.items.length]
            );
          },
          itemCount: widget.speed == Speed.stop ? widget.items.length : null,
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          physics: NeverScrollableScrollPhysics(), // not allow the user to scroll.
          shrinkWrap: true,
      )
    );
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  Future<bool> _scroll() async {
    double _moveDistance = widget.speed == Speed.stop ? 0.0 : 10.0;

    _position += _moveDistance;
    _scrollController.animateTo(_position, duration: widget.speed.moveDuration, curve: Curves.linear);

    await Future.delayed(widget.speed.moveDuration);
    return true;
  }
}