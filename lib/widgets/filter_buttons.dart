import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:money_flow/providers/providers.dart';
import 'package:money_flow/services/card_service.dart';
import 'package:money_flow/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FilterButtons extends StatefulWidget {
  FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    final cardService = Provider.of<CardService>(context);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (cardService.moveScroll == true) {
        if (DateTime.now().month == 4) _controller.jumpTo(395);

        if (DateTime.now().month == 8) _controller.jumpTo(731);

        if (DateTime.now().month == 11) _controller.jumpTo(938);
      }
      cardService.moveScroll = false;
    });

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          print(_controller.offset);
        },
        child: ListView.builder(
          controller: _controller,
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
      ),
    );
  }
}
