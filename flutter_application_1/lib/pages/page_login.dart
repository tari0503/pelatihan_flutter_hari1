import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    // validasi form
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await authService.login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login berhasil')));

      // pindah halaman
      // Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Form')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              // ================= EMAIL =================
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),

                validator: Validators.email,
              ),

              const SizedBox(height: 16),

              // ================= PASSWORD =================
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,

                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),

                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),

                validator: Validators.password,

                onFieldSubmitted: (_) {
                  _handleSubmit();
                },
              ),

              const SizedBox(height: 24),

              // ================= BUTTON =================
              FilledButton(
                onPressed: _isLoading ? null : _handleSubmit,

                child: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Masuk'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ======================================================
// VALIDATORS
// ======================================================

class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email wajib diisi';
    }

    final RegExp emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }

    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }

    return null;
  }
}

// ======================================================
// AUTH SERVICE
// ======================================================

class AuthService {
  Future<void> login({required String email, required String password}) async {
    // simulasi loading API
    await Future.delayed(const Duration(seconds: 2));

    // validasi kosong
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email dan password wajib diisi');
    }

    // contoh login berhasil
    if (email == 'admin@gmail.com' && password == '12345678') {
      return;
    }

    // login gagal
    throw Exception('Email atau password salah');
  }
}

// ======================================================
// GLOBAL OBJECT
// ======================================================

final AuthService authService = AuthService();
