import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:linkifoot/core/responsive/constrained_scaffold.dart';
import 'package:linkifoot/core/widgets/primary_button.dart';
import 'package:linkifoot/features/user/presentation/widgets/account_link.dart';
import 'package:linkifoot/features/user/presentation/widgets/customt_text_field_auth.dart';

// class SignInPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedScaffold(
//       body: Center(
//         child: Text(context.l10n.welcome('majdiiii')),
//       ),
//     );
//   }
// }

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedScaffold(
        backgroundColor: theme.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.primary,
          elevation: 0,
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          //   onPressed: () => context.go('/home'),
          // ),
          title: const Text(
            '__Welcome Back',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body:
            // BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
            //   if (state is Failure) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(
            //         content: Text(state.failure.message),
            //         backgroundColor: Colors.red,
            //       ),
            //     );
            //   } else if (state is Authenticated) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       const SnackBar(
            //         content: Text('Account created successfully!'),
            //         backgroundColor: Colors.green,
            //       ),
            //     );
            //     context.go('/home', extra: state.user);
            //     // Navigator.pushReplacementNamed(context, '/dashboard_user',
            //     //     arguments: state.user);
            //   }
            // }, builder: (context, state) {
            //   final isLoading = state is Loading;

            // return
            SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '__Get started with your exam prep',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Email Field
                        CustomTextFieldAuth(
                          controller: _emailController,
                          label: '__Email',
                          hintText: '__Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '__Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Password Field
                        CustomTextFieldAuth(
                          controller: _passwordController,
                          label: '__Password',
                          hintText: '__Create a password',
                          obscureText: !_isPasswordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),

                        // Create Account Button
                        PrimaryButton(
                          text: '__Sign In',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Form is valid, proceed with signup

                              // await context
                              //     .read<AuthCubit>()
                              //     .signInWithEmailAndPassword(
                              //       _emailController.text.trim(),
                              //       _passwordController.text.trim(),
                              //     );

                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //       content: Text('__Processing Data')),
                              // );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Divider with text
                // const DividerWithText(text: 'or continue with'),

                // Social Login Buttons
                const SizedBox(height: 8),

                // Google Button
                // SocialButton(
                //   text: 'Continue with Google',
                //   icon: const Icon(Icons.g_mobiledata,
                //       size: 24), // Need to use proper Google icon
                //   onPressed: () {},
                //   type: SocialButtonType.outlined,
                // ),

                const SizedBox(height: 12),

                // Facebook Button
                // SocialButton(
                //   text: 'Continue with Facebook',
                //   icon: const Icon(Icons.facebook, size: 20),
                //   onPressed: () {},
                //   type: SocialButtonType.filled,
                //   backgroundColor: Colors.blue[700],
                // ),

                // Already have an account
                const SizedBox(height: 24),
                AccountLink(
                  message: 'Create an account? bbsads ',
                  linkText: 'Sign up',
                  onTap: () => context.go('/register'),
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, '/register', (route) => false),
                ),
              ],
            ),
          ),
        ));
  }
}
