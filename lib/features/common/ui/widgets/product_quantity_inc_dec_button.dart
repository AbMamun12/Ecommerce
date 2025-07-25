import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductQuantityIncDecButton extends StatefulWidget {
  const ProductQuantityIncDecButton({super.key, required this.onChange});

  final Function(int)onChange;

  @override
  State<ProductQuantityIncDecButton> createState() =>
      _ProductQuantityIncDecButtonState();
}

class _ProductQuantityIncDecButtonState
    extends State<ProductQuantityIncDecButton> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
          icon: Icons.remove,
          onTap: () {
            if (_count > 1) {
              _count--;
              widget.onChange(_count);
              setState(() {});
            }
          },
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('$_count', style: TextStyle(fontSize: 18)),
        ),
        _buildIconButton(
          icon: Icons.add,
          onTap: () {
            if (_count < 20) {
              _count++;
              widget.onChange(_count);
              setState(() {});
            }
          },
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
