import 'package:flutter/material.dart';

class PagedListLoading extends StatelessWidget {
  const PagedListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
