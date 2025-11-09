import 'package:flutter/material.dart';

class TitleListView extends StatelessWidget {
  const TitleListView({
    super.key,
    required this.title,
    required this.cards,
    this.onSeeAll,
  });

  final String title;
  final List<Widget> cards;
  final VoidCallback? onSeeAll;

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
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: onSeeAll ?? () {},
                child: const Text('See All'),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: cards,
          ),
        ),
      ],
    );
  }
}
