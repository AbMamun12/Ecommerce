import 'package:e_commerce/features/common/ui/controllers/category_list_controller.dart';
import 'package:e_commerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce/features/common/ui/widgets/ShimmerCategoryGrid.dart';
import 'package:e_commerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:e_commerce/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  static const String name = 'category-list-screen';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category List'),
          leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (controller) {
              if (controller.inProgress){
                return ShimmerCategoryGrid();
              }
              return GridView.builder(
                itemCount: controller.categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return  FittedBox(child: CategoryItemWidget(
                    categoryModel: controller.categoryList[index],
                  ));
                },
              );
            }
          ),
        ),
      ),
    );
  }

  void _onPop() {
    Future.delayed(Duration.zero, () {
      Get.find<MainBottomNavController>().backToHome();
    });
  }
}
