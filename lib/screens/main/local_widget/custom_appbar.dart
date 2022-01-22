import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key, this.controller, required this.bottom, required this.onSubmit})
      : super(key: key);

  final TextEditingController? controller;
  final PreferredSizeWidget bottom;
  final Function(String value) onSubmit;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10));

    return SliverAppBar(
        floating: true,
        pinned: true,
        snap: false,
        bottom: bottom,
        title: SizedBox(
          height: 40,
          child: TextField(
              onSubmitted: onSubmit,
              keyboardType: TextInputType.text,
              maxLines: 1,
              textInputAction: TextInputAction.search,
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  fillColor: Theme.of(context).dividerColor)),
        ));
  }
}
