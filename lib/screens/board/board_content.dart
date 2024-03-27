import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/board/item.dart';
import 'package:saasify/screens/board/menu_list_item.dart';
import 'package:saasify/screens/board/task.dart';
import 'board_utility_button.dart';
import 'board_search_button.dart';

Widget buildBoardContent(
    List<Task> tasks, Function(Item, Task, Task) itemDropCallback) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const BoardSearchButton(),
      const BoardUtilityButton(),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kBoardstatuspadingh, vertical: kBoardStatuspadingv),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var process in tasks)
              DragTarget<Item>(
                builder: (context, candidateItems, rejectedItems) {
                  return SizedBox(
                    height: kBoardStatusHeight,
                    child: Container(
                      padding: const EdgeInsets.all(kBoardTilePadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBoardStatusRedius),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      width: 290,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            process.name,
                            style: const TextStyle(
                              fontSize: spacingStandard,
                              color: AppColors.darkGrey,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: process.items.length,
                              itemBuilder: (context, index) {
                                final item = process.items[index];
                                return Draggable<Item>(
                                  data: item,
                                  feedback: Material(
                                    child: Text(item.name),
                                  ),
                                  child: MenuListItem(
                                    name: item.name,
                                  ),
                                  onDragEnd: (details) {
                                    if (details.wasAccepted) {
                                      process.items.remove(item);
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                onAcceptWithDetails: (details) {
                  final item = details.data;
                  final currentTask =
                      tasks.firstWhere((task) => task.name == process.name);
                  if (!currentTask.items.contains(item)) {
                    final sourceTask = tasks
                        .firstWhere((task) => task.name == currentTask.name);
                    sourceTask.items.remove(item);
                    itemDropCallback(item, sourceTask, currentTask);
                  }
                },
              ),
          ],
        ),
      ),
    ],
  );
}
