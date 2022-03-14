import 'package:flutter/material.dart';

class TargetPerhitungan extends StatelessWidget {
  const TargetPerhitungan({
    Key? key,
    required this.selectedDrowpdown,
    required this.listSatuanSuhu, 
    required this.onDropdownChanged,
    required this.Konversi,
  }) : super(key: key);

  final String selectedDrowpdown;
  final List<String> listSatuanSuhu;
  final Function onDropdownChanged;
  final Function Konversi;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: selectedDrowpdown,
      items: listSatuanSuhu.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(), 
      onChanged: (value){
        onDropdownChanged(value);
        Konversi(value);
      },
        );
  }
}
