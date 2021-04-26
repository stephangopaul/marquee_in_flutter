import 'package:flutter/cupertino.dart';

class AlternateMarquee extends StatefulWidget {

  final List<Widget> items;
  final Duration animationDuration, backDuration, pauseDuration;

  AlternateMarquee({
    Key key,
    @required this.items,
    this.animationDuration = const Duration(seconds: 1),
    this.backDuration = const Duration(seconds: 1),
    this.pauseDuration = const Duration(seconds: 1),
  }): super(key: key);

  @override
  _AlternateMarqueeState createState() => _AlternateMarqueeState();
}

class _AlternateMarqueeState extends State<AlternateMarquee> {

  ScrollController _scrollController;

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: widget.items),
      controller: _scrollController,
      physics: NeverScrollableScrollPhysics(),// not allow the user to scroll.
    );
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  Future<bool> _scroll() async {
    await Future.delayed(widget.pauseDuration);
    _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: widget.animationDuration, curve: Curves.easeOut);
    await Future.delayed(widget.pauseDuration);
    _scrollController.animateTo(_scrollController.position.minScrollExtent, duration: widget.backDuration, curve: Curves.easeOut);
    return true;
  }
}