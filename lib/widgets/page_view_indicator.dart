import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({
    required this.isCurrentPage,
    this.marginEnd = 0,
    super.key,
  });
 final bool isCurrentPage;
 final double marginEnd;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      height: isCurrentPage ? 8 : 8,
      width: isCurrentPage ? 40 : 8,
      decoration: BoxDecoration(
        color: isCurrentPage ? const Color(0xFFF35C56): const Color(0xFFE4E4E6),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
