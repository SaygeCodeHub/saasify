import 'package:flutter/material.dart';

class PrintDialog extends StatefulWidget {
  @override
  _PrintDialogState createState() => _PrintDialogState();
}

class _PrintDialogState extends State<PrintDialog> {
  late TextEditingController counterController;
  int _numberOfBarcodes = 1;

  @override
  void initState() {
    super.initState();
    counterController = TextEditingController(text: '$_numberOfBarcodes');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 100,
        width: 300,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Number of Barcodes : '),
            SizedBox(width: 12,),
            SizedBox(
                width: 80,
                height: 35,
                child: TextFormField(
                  maxLength: 5,
                  controller: counterController,
                  onChanged: (value) {
                    _numberOfBarcodes = int.tryParse(value) ?? 0;
                  },
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )),
            Column(mainAxisSize: MainAxisSize.min, children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      _numberOfBarcodes++;
                      counterController.text = '$_numberOfBarcodes';
                    });
                  },
                  child: const Icon(
                    Icons.arrow_drop_up,
                    size: 16,
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      if (_numberOfBarcodes > 0) {
                        _numberOfBarcodes--;
                        counterController.text = '$_numberOfBarcodes';
                      }
                    });
                  },
                  child: const Icon(
                    Icons.arrow_drop_down,
                    size: 16,
                  ))
            ])
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            print('Number of Barcodes: $_numberOfBarcodes');
          },
          child: const Text('Print'),
        ),
      ],
    );
  }
}
