import 'package:first_application/app/di.dart';
import 'package:first_application/presentation/login/login_viewmodel.dart';
import 'package:first_application/presentation/state_renderer/state_renderer_impl.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel _viewModel = instance<LoginViewModel>();

  //Burası kullanıcıyla buluştuğumuz ilk ekran burda sadece tasarım kodları var !
  //fonksiyonlarımızı kullanmak için viewmodeldan bir instance alıyoruz çünkü bütün fonksiyonlarımız viewmodelda

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data
                    ?.getScreenWidget(context, _getContentWidget(), () {}) ??
                _getContentWidget();
          },
        ),
      )),
    );
  }

  Widget _getContentWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Form(
          child: IntrinsicHeight(
            child: Column(
              children: [
                Spacer(),
                Lottie.asset("assets/json_assets/hosgeldin.json", height: 250),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            labelText: "Kullanıcı Adı",
                            hintText: "Kullanıcı Adı"),
                      ),
                    )),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {},
                          ),
                          hintText: "Şifre",
                          labelText: "Şifre",
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: ElevatedButton(
                        onPressed: () {
                          _viewModel.login();
                        },
                        child: Text("Giriş Yap"))),
                Expanded(
                  flex: 2,
                  child: TextButton(
                      onPressed: () {},
                      child: Text("Üye Olmak İçin Tıklayınız")),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
