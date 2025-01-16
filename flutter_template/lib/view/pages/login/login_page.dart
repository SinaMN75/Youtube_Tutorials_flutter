import 'package:sample_project/core/core.dart';
import 'package:sample_project/view/pages/login/login_controller.dart';
import 'package:u/utilities.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginController {
  @override
  Widget build(final BuildContext context) => UScaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              UTextField(
                controller: controllerUserName,
                labelText: s.username,
                validator: validateNotEmpty(),
              ).pSymmetric(vertical: 12),
              UTextField(
                controller: controllerPassword,
                labelText: s.password,
                validator: validateMinLength(5),
              ).pSymmetric(vertical: 12),
              UElevatedButton(
                onTap: login,
                title: s.login,
              ).pSymmetric(vertical: 12),
            ],
          ),
        ),
      );
}
