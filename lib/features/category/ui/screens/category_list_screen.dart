import 'package:e_commerce/features/common/ui/controllers/category_list_controller.dart';
import 'package:e_commerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce/features/common/ui/widgets/ShimmerCategoryGrid.dart';
import 'package:e_commerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:e_commerce/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  static const String name = 'category-list-screen';

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryListController _categoryListController=Get.find<CategoryListController>();

   final ScrollController _scrollController=ScrollController() ;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreData);
    _categoryListController.getCategoryList();
  }

  void _loadMoreData(){
    if(_scrollController.position.extentAfter<300){
      _categoryListController.getCategoryList();
    }
  }


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
              if (controller.initialInProgress){
                return ShimmerCategoryGrid();
              }
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
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
                    ),
                  ),
                  Visibility(
                      visible:controller.inProgress ,
                      child: LinearProgressIndicator()),
                ],
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
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
