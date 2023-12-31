
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../views/login_view.dart';
import 'constants.dart';
import '../homePageSreen/controller/simple_ui_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildLargeScreen(size, simpleUIController, theme);
            } else {
              return _buildSmallScreen(size, simpleUIController, theme);
            }
          },
        ),
      ),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
    Size size,
    SimpleUIController simpleUIController,
    ThemeData theme,
  ) {
    return Row(
      children: [
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 5,
          child: _buildMainBody(size, simpleUIController, theme),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
    Size size,
    SimpleUIController simpleUIController,
    ThemeData theme,
  ) {
    return Center(
      child: _buildMainBody(size, simpleUIController, theme),
    );
  }

  /// Main Body
  Widget _buildMainBody(
    Size size,
    SimpleUIController simpleUIController,
    ThemeData theme,
  ) {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: size.width > 600
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 500),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Регистрация',
                style: kLoginTitleStyle(size),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    /// username
                    TextFormField(
                      style: kTextFormFieldStyle(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'ИНН',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      controller: nameController,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите инн паспорта';
                        } else if (value.length < 4) {
                          return 'введите цифры';
                        } else if (value.length > 13) {
                          return 'максимальное количество цифр 12';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),

                    /// Gmail
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      style: kTextFormFieldStyle(),
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone_android),
                        hintText: '+996',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите номер телефона';
                        } else if (!value.endsWith('996')) {
                          return 'максимальное количество цифр 9';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),

                    /// password
                    Obx(
                      () => TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: kTextFormFieldStyle(),
                        controller: passwordController,
                        obscureText: simpleUIController.isObscure.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_open),
                          suffixIcon: IconButton(
                            icon: Icon(
                              simpleUIController.isObscure.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              simpleUIController.isObscureActive();
                            },
                          ),
                          hintText: 'Пароль',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Пожалуйста, введите пароль';
                          } else if (value.length < 7) {
                            return 'введите не менее 6 символов';
                          } else if (value.length > 13) {
                            return 'максимальное количество символов 9';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Создание учетной записи означает, что вы согласны\n с нашимиУсловиями предоставления услуг и нашей',
                          style: kLoginTermsAndPrivacyStyle2(size),
                          children: [
                            
                            TextSpan(
                              text: '\n         Политикой конфиденциальности.',
                              style: kLoginOrSignUpTextStyle3(size),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),

                    /// SignUp Button
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // ... Navigate To your Home Page
                        }
                      },
                      child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: SizedBox(
                          height: 55,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 108, 173, 159)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // ... Navigate To your Home Page
                              }
                            },
                            child: const Text('Зарегистрироваться'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),

                    /// Navigate To Login Screen
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 700),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    LoginView(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = Offset(1.1, 1.1);
                              var end = Offset.zero;
                              var curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'У вас уже есть аккаунт?',
                          style: kLoginTermsAndPrivacyStyle(size),
                          children: [
                            TextSpan(
                              text: ' войти',
                              style: kLoginOrSignUpTextStyle(size),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
