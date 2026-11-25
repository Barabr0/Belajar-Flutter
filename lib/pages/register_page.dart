import 'package:flutter/material.dart';
import '../services/api_exception.dart';
import '../services/auth_service.dart';
import '../widgets/auth_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  final _auth = AuthService();
  bool _loading = false;
  bool _accepted = false;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _register() async {
    if (_nameC.text.trim().isEmpty ||
        _emailC.text.trim().isEmpty ||
        _passC.text.length < 8) {
      _showMessage('Lengkapi data, password minimal 8 karakter');
      return;
    }
    if (!_accepted) {
      _showMessage('Setujui kebijakan dan ketentuan terlebih dahulu');
      return;
    }

    setState(() => _loading = true);
    try {
      await _auth.register(
        name: _nameC.text.trim(),
        email: _emailC.text.trim(),
        password: _passC.text,
      );
      if (!mounted) return;
      _showMessage('Register berhasil, silakan login');
      Navigator.pop(context); // kembali ke halaman login
    } on ApiException catch (e) {
      if (mounted) _showMessage(e.message);
    } catch (_) {
      if (mounted) _showMessage('Terjadi kesalahan tak terduga');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Stack(
          children: [
            Positioned(
              top: 12,
              left: 16,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 18),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 40),
                    GlassField(controller: _nameC, hint: 'Your name'),
                    const SizedBox(height: 14),
                    GlassField(
                      controller: _emailC,
                      hint: 'Your e-mail',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 14),
                    GlassField(
                      controller: _passC,
                      hint: 'Create a password (min 8)',
                      obscure: true,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: 'I accept ',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 13),
                              children: const [
                                TextSpan(
                                  text: 'the policy and terms.',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Checkbox(
                          value: _accepted,
                          onChanged: (v) =>
                              setState(() => _accepted = v ?? false),
                          side: const BorderSide(color: Colors.white70),
                          activeColor: const Color(0xFFA9C77A),
                          checkColor: Colors.black87,
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    GradientPillButton(
                      label: 'Create Account',
                      loading: _loading,
                      onPressed: _loading ? null : _register,
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