import 'package:flutter/material.dart';

class MobileTrackPage extends StatefulWidget {
  const MobileTrackPage({Key? key}) : super(key: key);

  @override
  _MobileTrackPageState createState() => _MobileTrackPageState();
}

class _MobileTrackPageState extends State<MobileTrackPage> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: screen.width * 0.6,
          child: Container(
            color: Colors.red,
            width: screen.width * 0.3,
          ),
        ),
      ),
    );
  }
}
