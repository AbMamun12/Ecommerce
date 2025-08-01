import 'package:e_commerce/app/urls.dart';
import 'package:e_commerce/features/home/data/models/slider_list_data_model.dart';
import 'package:e_commerce/features/home/data/models/slider_model.dart';
import 'package:e_commerce/features/home/data/models/slider_pagination_response.dart';
import 'package:e_commerce/service/network_caller/network_caller.dart';
import 'package:get/get.dart';

class SliderListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress =>_inProgress;

  SliderPaginationModel? _sliderPaginationModel;

  List<SliderModel> get bannerList => _sliderPaginationModel?.data?.results ?? [];
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.homeSliderUrl,
    );
    if (response.isSuccess) {
      _sliderPaginationModel = SliderPaginationModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();

    return isSuccess;
  }
}
