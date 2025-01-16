import 'package:sample_project/view/pages/login/login_page.dart';
import 'package:sample_project/view/pages/products/products_page.dart';
import 'package:u/utilities.dart';

mixin SplashController {
  void init() {
    delay(2000, () {
      if (ULocalStorage.getString(UConstants.token) == null)
        UNavigator.offAll(const LoginPage());
      else
        UNavigator.offAll(const ProductsPage());
    });
  }
}
