import 'package:flutter/cupertino.dart';

class ScrollMarquee extends StatefulWidget {

  final List<Widget> items;
  final Duration moveDuration;

  ScrollMarquee({
    Key key,
    @required this.items,
    this.moveDuration = const Duration(milliseconds: 100)
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
    return ListView.builder(
        itemBuilder: (context, index) {
          return Center(
            child: widget.items[index % widget.items.length]
          );
        },
        itemCount: widget.moveDuration == Duration.zero ? widget.items.length : null,
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
    );
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  Future<bool> _scroll() async {
    double _moveDistance = 10.0;

    _position += _moveDistance;
    _scrollController.animateTo(_position, duration: widget.moveDuration, curve: Curves.linear);

    await Future.delayed(widget.moveDuration);
    return true;
  }
}