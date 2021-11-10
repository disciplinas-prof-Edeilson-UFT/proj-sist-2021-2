import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/order/components/details_page/components/map_container.dart';
import 'package:pscomidas/app/modules/order/components/details_page/components/status_container.dart';

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
          child: Column(
            children: const [
              MapContainer(),
              Divider(
                height: 20,
                color: Colors.transparent,
              ),
              StatusContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
