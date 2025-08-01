import 'package:e_commerce/app/assets_path.dart';
import 'package:e_commerce/features/common/data/models/category_model.dart';
import 'package:e_commerce/features/common/data/models/product_Model.dart';
import 'package:e_commerce/features/common/ui/controllers/category_list_controller.dart';
import 'package:e_commerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce/features/common/ui/widgets/ShimmerCategoryGrid.dart';
import 'package:e_commerce/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:e_commerce/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:e_commerce/features/home/ui/controllers/slider_list_controller.dart';
import 'package:e_commerce/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:e_commerce/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:e_commerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:e_commerce/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:e_commerce/features/home/ui/widgets/home_section_header.dart';
import 'package:e_commerce/features/common/ui/widgets/product_item_widget.dart';
import 'package:e_commerce/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(controller: _searchBarController),
              const SizedBox(height: 16),
              GetBuilder<SliderListController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return SizedBox(
                      height: 180,
                      child: ShimmerCategoryGrid(),
                    );
                  }
                  return HomeCarouselSlider(
                    sliderList: controller.bannerList,
                  );
                },
              ),
              const SizedBox(height: 16),
              HomeSectionHeader(
                title: 'Category',
                onTap: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              const SizedBox(height: 8),
              GetBuilder<CategoryListController>(
                builder: (controller) {

                  if (controller.inProgress){
                    return SizedBox(
                      height: 100,
                      child: ShimmerCategoryGrid(),
                    );
                  }


                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    //child: Row(children: _getCategoryList(controller.categoryList)),
                  );
                }
              ),
              const SizedBox(height: 16),
              HomeSectionHeader(title: 'Popular', onTap: () {}),
              GetBuilder<PopularProductListController>(
                builder: (controller) {
                  if (controller.inProgress){
                    return const SizedBox(
                      height: 200,
                      child: ShimmerCategoryGrid(),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: _getProductList(controller.productList)),
                  );
                }
              ),
              const SizedBox(height: 16),
              HomeSectionHeader(title: 'Special', onTap: () {}),
              GetBuilder<SpecialProductListController>(
                  builder: (controller) {
                    if (controller.inProgress){
                      return const SizedBox(
                        height: 200,
                        child: ShimmerCategoryGrid(),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: _getProductList(controller.productList)),
                    );
                  }
              ),
              const SizedBox(height: 8),
              HomeSectionHeader(title: 'New', onTap: () {}),
              GetBuilder<NewProductListController>(
                  builder: (controller) {
                    if (controller.inProgress){
                      return const SizedBox(
                        height: 200,
                        child: ShimmerCategoryGrid(),
                      );
                    }
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: _getProductList(controller.productList)),
                    );
                  }
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList(List<CategoryItemModel>categoryModels) {
    List<Widget> categoryList = [];
    for (int i = 0; i < categoryModels.length; i++) {
      // categoryList.add(
      //    Padding(
      //     padding: EdgeInsets.only(right: 16),
      //     child: CategoryItemWidget(
      //       categoryModel: categoryModels[i],
      //     ),
      //   ),
      // );
    }
    return categoryList;
  }

  List<Widget> _getProductList(List<ProductModel>productList) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < productList.length; i++) {
      list.add(
         Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ProductItemWidget(
            productModel: productList[i],
          ),
        ),
      );
    }
    return list;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions: [
        AppBarIconButton(icon: Icons.person_outline, onTap: () {}),
        const SizedBox(width: 6),
        AppBarIconButton(icon: Icons.call, onTap: () {}),
        const SizedBox(width: 6),

        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
