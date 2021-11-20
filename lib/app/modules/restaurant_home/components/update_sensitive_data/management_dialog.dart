import 'package:flutter/material.dart';
import 'management_formulary.dart';

class ManagementDialog extends StatefulWidget {
  const ManagementDialog({Key? key}) : super(key: key);

  @override
  _ManagementDialogState createState() => _ManagementDialogState();
}

class _ManagementDialogState extends State<ManagementDialog> {
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: ManagementFormulary(),
    );
  }
}
