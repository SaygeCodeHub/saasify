import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'board_app_bar.dart';
import 'board_content.dart';
import 'item.dart';
import 'task.dart';


List<Item> items = [
  const Item(
    name: 'DashBoard Screen',
    uid: '1',
  ),
  const Item(
    name: 'Home Screen',
    uid: '2',
  ),
  const Item(
    name: 'Board Screen',
    uid: '3',
  ),
  const Item(
    name: 'Login UI',
    uid: '4',
  ),
];

@immutable
class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen>
    with TickerProviderStateMixin {
  final List<Task> _tasks = [
    Task(
      name: 'To do',
      items: items,
    ),
    Task(
      name: 'In-Process',
    ),
    Task(
      name: 'Pending',
    ),
    Task(
      name: 'Ready For Testing',
    ),
    Task(
      name: 'Done',
    ),
  ];

  void _itemDroppedOnTaskCart(Item item, Task sourceTask, Task targetTask) {
    setState(() {
      targetTask.items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: buildAppBar(),
      body: buildBoardContent(_tasks, _itemDroppedOnTaskCart),
    );
  }
}
