import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //formKey.currentState!.validate();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15), // Aquí se puede agregar const
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                // Agregamos const porque el texto y su estilo no cambiarán
                'Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                  height: 30), // Usamos const porque las dimensiones son const
              AuthField(
                hintText: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 15),
              AuthField(
                hintText: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(height: 20),
              const AuthGradientButton(
                text: "Sign in",
              ), // Agregamos const si el botón no tiene parámetros dinámicos
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    SignUpPage.route(),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
