import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant_home/components/components_profile_dialog.dart';
import 'management_formulary.dart';

class ManagementDialog extends StatefulWidget {
  const ManagementDialog({Key? key}) : super(key: key);

  @override
  _ManagementDialogState createState() => _ManagementDialogState();
}

class _ManagementDialogState extends State<ManagementDialog> {
  @override
  Widget build(BuildContext context) {
    double _pageWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const NextIcon(
          currentState: 'Gerenciamento',
          direction: 'Anterior',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: _pageWidth * 0.4,
              child: ManagementFormulary(),
            ),
          ),
        ),
        const NextIcon(
          currentState: 'Gerenciamento',
          direction: 'Proximo',
        ),
      ],
    );
  }
}
