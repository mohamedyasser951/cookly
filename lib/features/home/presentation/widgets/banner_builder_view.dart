import 'package:cookly/core/constants/assets.dart';
import 'package:flutter/material.dart';

class BannerBuilderView extends StatefulWidget {
  const BannerBuilderView({super.key});

  @override
  State<BannerBuilderView> createState() => _BannerBuilderViewState();
}

class _BannerBuilderViewState extends State<BannerBuilderView> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          child: Image.asset(Assets.imagesRecipeBanner, fit: BoxFit.cover),
        );
      },
    );
  }
}
