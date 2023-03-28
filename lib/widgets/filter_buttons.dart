import 'package:flutter/material.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FilterButtons extends StatelessWidget {
  const FilterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: dateProvider.filterButtons.length,
        itemBuilder: (context, index) {
          return DateButton(
            name: dateProvider.filterButtons[index].month,
            id: dateProvider.filterButtons[index].id,
            state: dateProvider.filterButtons[index].state,
            index: index,
            isPressed: dateProvider.idPressed[index].state,
          );
        },
      ),
    );
  }
}
