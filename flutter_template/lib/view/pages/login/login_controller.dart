import 'package:sample_project/data/data.dart';
import 'package:sample_project/view/pages/products/products_page.dart';
import 'package:u/utilities.dart';

mixin LoginController {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController controllerUserName = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final RemoteDataSource dataSource = RemoteDataSource();

  void login() {
    validateForm(
      key: formKey,
      action: () async {
        ULoading.showLoading();
        dataSource.login(
          dto: LoginParams(
            phone: controllerUserName.text,
            password: controllerPassword.text,
          ),
          onResponse: (final LoginResponse response) {
            ULocalStorage.set(UConstants.token, response.data!.token);
            ULoading.dismissLoading();
            UNavigator.offAll(const ProductsPage());
          },
          error: (final EmptyResponse response) {
            ULoading.dismissLoading();
            UNavigator.snackbarRed(title: "Error", subtitle: response.message);
          },
        );
      },
    );
  }
}
