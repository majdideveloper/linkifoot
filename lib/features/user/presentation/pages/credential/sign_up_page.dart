import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkifoot/core/responsive/constrained_scaffold.dart';
import 'package:linkifoot/core/widgets/primary_button.dart';
import 'package:linkifoot/features/user/presentation/widgets/account_link.dart';
import 'package:linkifoot/features/user/presentation/widgets/customt_text_field_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  // final _userNameController = TextEditingController();
  String? _selectedRole;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
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
          //   onPressed: () => Navigator.pushNamed(context, '/home'),
          // ),
          title: const Text(
            'Create Your Account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body:
            //  BlocConsumer<AuthCubit, AuthState>(
            //   listener: (context, state) {
            //     if (state is Failure) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text(state.failure.message),
            //           backgroundColor: Colors.red,
            //         ),
            //       );
            //     } else if (state is Authenticated) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text('Account created successfully!'),
            //           backgroundColor: Colors.green,
            //         ),
            //       );
            //       context.go('/home', extra: state.user);
            //       // Navigator.pushReplacementNamed(context, '/dashboard_user',
            //       //     arguments: state.user);
            //     }
            //   },
            //   builder: (context, state) {
            //     final isLoading = state is Loading;
            //     return
            SingleChildScrollView(
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
                        'Get started with your exam prep',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomTextFieldAuth(
                        controller: _fullNameController,
                        label: 'Full Name',
                        hintText: 'Enter your full name',
                        validator: (value) => (value == null || value.isEmpty)
                            ? 'Please enter your name'
                            : null,
                      ),
                      // const SizedBox(height: 16),
                      // CustomTextFieldAuth(
                      //   controller: _userNameController,
                      //   label: 'User Name',
                      //   hintText: 'Enter your user name',
                      //   validator: (value) => (value == null || value.isEmpty)
                      //       ? 'Please enter your user name'
                      //       : null,
                      // ),

                      const SizedBox(height: 16),
                      CustomTextFieldAuth(
                        controller: _emailController,
                        label: 'Email',
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextFieldAuth(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: 'Create a password',
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
                      const SizedBox(height: 16),
                      // Role selection
                      const Text(
                        'Select your role:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Radio<String>(
                                value: 'player',
                                groupValue: _selectedRole,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRole = value;
                                  });
                                },
                              ),
                              const Text('Player'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'coach',
                                groupValue: _selectedRole,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRole = value;
                                  });
                                },
                              ),
                              const Text('Coach'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'agent',
                                groupValue: _selectedRole,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRole = value;
                                  });
                                },
                              ),
                              const Text('Agent'),
                            ],
                          ),
                        ],
                      ),
                      if (_selectedRole == null)
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            'Please select a role',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        text: 'Create Account',
                        onPressed:
                            // isLoading
                            //     ? null
                            //     :
                            () async {
                          if (_formKey.currentState!.validate() &&
                              _selectedRole != null) {
                            // await context
                            //     .read<AuthCubit>()
                            //     .signUpWithEmailAndPassword(
                            //       _emailController.text.trim(),
                            //       _passwordController.text.trim(),
                            //       _fullNameController.text.trim(),
                            //       _selectedRole!,
                            //     );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // const DividerWithText(text: 'or continue with'),
              const SizedBox(height: 8),
              // SocialButton(
              //   text: 'Continue with Google',
              //   icon: const Icon(Icons.g_mobiledata, size: 24),
              //   onPressed: () {
              //     // context.read<AuthCubit>().signInWithGoogle();
              //   },
              //   type: SocialButtonType.outlined,
              // ),
              const SizedBox(height: 12),
              // SocialButton(
              //   text: 'Continue with Facebook',
              //   icon: const Icon(Icons.facebook, size: 20),
              //   onPressed: () {
              //     // context.read<AuthCubit>().signInWithFacebook();
              //   },
              //   type: SocialButtonType.filled,
              //   backgroundColor: Colors.blue[700],
              // ),
              const SizedBox(height: 24),
              AccountLink(
                message: 'Already have an account? ',
                linkText: 'Sign in',
                onTap: () => context.go('/login'),
                // Navigator.pushNamedAndRemoveUntil(
                //     context, '/login', (route) => false),
              ),
            ],
          ),
        ));
  }
}
