import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/initialise/initialise_bloc.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/bloc/initialise/initialise_states.dart';

import '../../di/app_module.dart';

class ChangeBranch extends StatefulWidget {
  const ChangeBranch({super.key});

  @override
  State<ChangeBranch> createState() => _ChangeBranchState();
}

class _ChangeBranchState extends State<ChangeBranch> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitialiseAppBloc, InitialiseAppStates>(
      listener: (context, state) {
        setState(() {});
      },
      child: Row(
        children: [
          const Icon(Icons.store, color: AppColors.darkBlue),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: FutureBuilder<String>(
                future: getIt<Cache>().getBranchName(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.toString());
                  } else {
                    return const Text('Select Branch');
                  }
                },
              ),
              items: context
                  .read<InitialiseAppBloc>()
                  .branches!
                  .map((item) => DropdownMenuItem<String>(
                        value: item!.branchName.toString(),
                        child: Text(item.branchName.toString()),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
