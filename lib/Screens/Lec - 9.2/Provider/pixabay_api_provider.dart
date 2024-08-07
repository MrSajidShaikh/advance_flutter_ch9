import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../../../Helper/api_helper.dart';
import '../../../Utils/globals.dart';
import '../modal/pixabay_api_modal.dart';

class PixabayApiProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  PixabayApiModal? pixabayApiModal;
  String search = 'flower';

  void searchImage(String img) {
    search = img;
    notifyListeners();
  }

  void clearSearch() {
    txtSearch.clear();
    notifyListeners();
  }

  Future<PixabayApiModal?> fromApi(String img) async {
    final data = await apiHelper.fetchApiData(img);
    pixabayApiModal = PixabayApiModal.fromApi(data);
    return pixabayApiModal;
  }

  Future<void> setWallpaper(String url) async {
    late String result;
    bool goToHome = false;
    try {
      result = await AsyncWallpaper.setWallpaper(
        url: url,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: goToHome,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      )
          ? 'Wallpaper set'
          : 'Failed to get wallpaper.';
    } on PlatformException {
      result = 'Failed to get wallpaper';
    }
  }
}