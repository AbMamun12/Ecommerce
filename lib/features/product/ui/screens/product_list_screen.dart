import 'package:e_commerce/features/common/ui/controllers/product_list_controller.dart';
import 'package:e_commerce/features/common/ui/widgets/ShimmerCategoryGrid.dart';
import 'package:e_commerce/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  static const String name = 'product/product-list-by-category';

  const ProductListScreen({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });

  final String categoryName;
  final int categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<ProductListController>().getProductListByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: GetBuilder<ProductListController>(
        builder: (controller) {

          if(controller.inProgress){
            return ShimmerCategoryGrid();
          }


          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              return FittedBox(child: ProductItemWidget(
                productModel: controller.productList[index],
              ));
            },
          );
        }
      ),
    );
  }
}
