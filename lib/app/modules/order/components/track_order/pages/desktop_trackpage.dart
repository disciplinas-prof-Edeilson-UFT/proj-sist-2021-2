import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/track_order/components/btn_to.dart';
import 'package:pscomidas/app/modules/order/components/track_order/components/piece_one_to.dart';
import 'package:pscomidas/app/modules/order/components/track_order/components/piece_two.dart';
import 'package:pscomidas/app/modules/order/components/track_order/components/stack_to.dart';

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
            width: screen.width * 0.65,
            child: Wrap(
              spacing: 10.0,
              children: [
                PieceOneTO(),
                PieceTwoTO(),
              ],
            )),
      ),
    );
  }
}
