import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.computer, size: 40, color: AppColors.themeColor),
        ),
        Text(
          'Computer',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.themeColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
