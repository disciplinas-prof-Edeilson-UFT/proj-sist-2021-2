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
    double _pageWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 24),
      title: const Text('Gerenciamento'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: _pageWidth * 0.4,
          child: Column(
            children: [
              ManagementFormulary(),
            ],
          ),
        ),
      ),
    );
  }
}
