import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
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
                'Sign Up.',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                  height:
                      30), // Usamos const porque las dimensiones son constantes
              AuthField(
                hintText: 'Name',
                controller: nameController,
              ), // AuthField tiene parámetros constantes
              const SizedBox(height: 15),
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
              const AuthGradientButton(), // Agregamos const si el botón no tiene parámetros dinámicos
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: 'Sign in',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppPallete.gradient2,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
