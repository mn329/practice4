import 'package:flutter/material.dart';
import 'package:practice4/widget/card_widget.dart';

class TitleListView extends StatelessWidget {
  const TitleListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: Text('See All')),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CardWidget(),
              CardWidget(),
              CardWidget(),
              CardWidget(),
              CardWidget(),
              CardWidget(),
              CardWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
