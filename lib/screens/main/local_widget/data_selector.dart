import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataSelector extends StatelessWidget {
  const DataSelector(
      {Key? key,
      this.onChanged,
      required this.selectedValue,
      this.isLazyLoad = true,
      required this.onLazyLoad,
      required this.onWithIndex})
      : super(key: key);

  final Function(String? value)? onChanged;
  final Function() onLazyLoad;
  final Function() onWithIndex;
  final String selectedValue;
  final bool isLazyLoad;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
                height: Get.width / 8,
                child: Row(children: [
                  RadioTiles(
                    flex: 1,
                    selectedValue: selectedValue,
                    onChanged: onChanged,
                    value: 'users',
                    label: 'Users',
                  ),
                  RadioTiles(
                      flex: 1,
                      selectedValue: selectedValue,
                      value: 'issues',
                      label: 'Issues',
                      onChanged: onChanged),
                  RadioTiles(
                      flex: 2,
                      value: 'repos',
                      label: 'Repositories',
                      selectedValue: selectedValue,
                      onChanged: onChanged)
                ])),
            SizedBox(
              height: Get.width / 8,
              child: Row(
                children: [
                  PaginateTypeButton(
                      label: "Lazy Loading",
                      onPressed: onLazyLoad,
                      isSelected: isLazyLoad),
                  const SizedBox(width: 10),
                  PaginateTypeButton(
                    label: "With Index",
                    isSelected: !isLazyLoad,
                    onPressed: onWithIndex,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class PaginateTypeButton extends StatelessWidget {
  const PaginateTypeButton(
      {Key? key, required this.label, this.onPressed, this.isSelected = false})
      : super(key: key);

  final String label;
  final Function()? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
              isSelected ? Theme.of(context).colorScheme.onPrimary : null),
          backgroundColor: MaterialStateProperty.all(
              isSelected ? Theme.of(context).primaryColor : Colors.transparent),
          side: MaterialStateProperty.all(
              BorderSide(color: Theme.of(context).primaryColor, width: 1))),
    );
  }
}

class RadioTiles extends StatelessWidget {
  const RadioTiles({
    Key? key,
    required this.selectedValue,
    required this.onChanged,
    required this.value,
    required this.label,
    required this.flex,
  }) : super(key: key);

  final String selectedValue;
  final Function(String? value)? onChanged;
  final String value;
  final String label;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: RadioListTile<String>(
            value: value,
            contentPadding: EdgeInsets.zero,
            title: Text(label,
                style: Theme.of(context).textTheme.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            groupValue: selectedValue,
            onChanged: onChanged));
  }
}
