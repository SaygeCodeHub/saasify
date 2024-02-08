import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:saasify/bloc/leaves/leaves_bloc.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';
import 'custom_date_picker.dart';

class DateDisplayWidget extends StatefulWidget {
  final String label;
  final bool isStartDate;
  const DateDisplayWidget(
      {super.key, required this.label, required this.isStartDate});

  @override
  DateDisplayWidgetState createState() => DateDisplayWidgetState();
}

class DateDisplayWidgetState extends State<DateDisplayWidget> {
  String formattedDate = '';

  void _selectDate() async {
    final DateTime? pickedDate = await CustomDatePicker.selectDate(context);
    String apiDateFormat = '';
    if (pickedDate != null) {
      setState(() {
        formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
        apiDateFormat = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        (widget.isStartDate == true)
            ? context.read<LeavesBloc>().leaveDetailsMap['start_date'] =
                apiDateFormat.toString()
            : context.read<LeavesBloc>().leaveDetailsMap['end_date'] =
                apiDateFormat.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LabelTextWidget(label: widget.label),
        const SizedBox(height: spacingMedium),
        TextField(
          readOnly: true,
          controller: TextEditingController(text: formattedDate),
          onTap: _selectDate,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.errorRed)),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.errorRed)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today),
              onPressed: _selectDate,
            ),
          ),
        ),
      ],
    );
  }
}
