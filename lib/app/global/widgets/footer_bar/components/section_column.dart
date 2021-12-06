import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SectionColumn extends StatelessWidget {
  const SectionColumn({ Key? key,
    required this.section,
    required this.itens,
  }) : super(key: key);
  final String section;
  final List<Map<String, String>> itens;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(section, 
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListView.builder(
          itemCount: itens.length,
          itemBuilder: (_, index) {
            return TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                foregroundColor:
                  MaterialStateProperty.resolveWith<Color>(_getButtonColor),
              ),
              onPressed: () {
                Modular.to.navigate(itens[index]["Route"]!);
              },
              child: Text(itens[index]["Name"]!),
            );
          },
          shrinkWrap: true,
        ),
      ],
    );
  }

  Color _getButtonColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.hovered)) {
      return Colors.black;
    }
    return Colors.grey;
  }

}