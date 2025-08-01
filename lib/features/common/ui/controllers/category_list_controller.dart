import 'package:e_commerce/app/urls.dart';
import 'package:e_commerce/features/common/data/models/category/category_pagination_model.dart';
import 'package:e_commerce/service/network_caller/network_caller.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  bool get initialInProgress => _page == 1;

  List<CategoryItemModel> _categoryList = [];

  List<CategoryItemModel> get categoryList => _categoryList ?? [];
  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  final int _count = 30;
  int _page = 0;
  int? _lastPage;

  Future<bool> getCategoryList() async {
    _page++;

    if (_lastPage != null && _page > _lastPage!) return false;
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> queryParams = {'count': _count, 'page': _page};
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.categoryListUrl,
      queryParams: queryParams,
    );
    if (response.isSuccess) {
      CategoryPaginationModel paginationModel =
          CategoryPaginationModel.fromJson(response.responseData);
      _categoryList.addAll(paginationModel.data?.results ?? []);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}
