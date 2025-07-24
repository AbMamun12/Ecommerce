import 'package:e_commerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = 'category-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category List')),
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 16
        ),
        itemBuilder: (context, index) {
          return FittedBox(
            child: const CategoryItemWidget(
            
            ),
          );

        },
      ),
    );
  }
}
