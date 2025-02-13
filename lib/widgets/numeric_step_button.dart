import 'package:flutter/material.dart';

class NumericStepButton extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int defaultValue;
  final TextEditingController controller;
  final String label;

  const NumericStepButton(
      {super.key,
      this.minValue = 0,
      this.maxValue = 10,
      this.defaultValue = 0,
      this.label = 'Label',
      required this.controller});

  @override
  State<NumericStepButton> createState() {
    return _NumericStepButtonState();
  }
}

class _NumericStepButtonState extends State<NumericStepButton> {
  @override
  Widget build(BuildContext context) {
    String controllerText = widget.controller.text;
    int counter = controllerText.isEmpty
        ? widget.defaultValue
        : int.parse(controllerText);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 26),
        ),
        Wrap(
          spacing: 8.0,
          children: [
            IconButton(
              icon: Icon(
                Icons.remove,
                color: Theme.of(context).highlightColor,
              ),
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
              iconSize: 32.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (counter > widget.minValue) {
                    counter--;
                  }
                  widget.controller.text = counter.toString();
                });
              },
            ),
            Text(
              '$counter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Theme.of(context).highlightColor,
              ),
              padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
              iconSize: 32.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                setState(() {
                  if (counter < widget.maxValue) {
                    counter++;
                  }
                  widget.controller.text = counter.toString();
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
