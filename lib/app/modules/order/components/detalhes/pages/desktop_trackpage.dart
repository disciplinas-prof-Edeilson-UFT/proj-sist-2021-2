import 'package:flutter/material.dart';

class DesktopTrackPage extends StatefulWidget {
  const DesktopTrackPage({Key? key}) : super(key: key);

  @override
  _DesktopTrackPageState createState() => _DesktopTrackPageState();
}

class _DesktopTrackPageState extends State<DesktopTrackPage> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
            width: screen.width * 0.7,
            child: Wrap(
              spacing: 100.0,
              children: [
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(3),
                  width: screen.width * 0.3,
                  height: 300,
                  child: Stack(
                    children: [
                      SizedBox(
                        child: Image.asset(
                          'assets/images/track_order/gps_img2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text('OPAAAAAAAAAAAAAA!!!'),
                    ],
                  ),
                ),
                Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(3),
                  width: screen.width * 0.3,
                  height: 300,
                )
              ],
            )),
      ),
    );
  }
}
