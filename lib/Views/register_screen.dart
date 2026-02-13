import 'package:flutter/material.dart';
import 'package:flutter_application/Components/app_card.dart';
import 'package:flutter_application/Views/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmVisible = false;
  bool isValidName(String name) {
    return RegExp(r"^[a-zA-Z0-9_]{3,20}$").hasMatch(name);
  }

  bool isValidEmail(String email) {
    return RegExp(r"^[\w\.-]+@[\w\.-]+\.\w+$").hasMatch(email);
  }

  bool isValidPassword(String password) {
    return RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{12,}$",
    ).hasMatch(password);
  }

  bool isValidPasswordConfirm() {
    return passwordController.text == confirmController.text;
  }

  bool isValidData() {
    return isValidName(usernameController.text) &&
        isValidEmail(emailController.text) &&
        isValidPassword(passwordController.text) &&
        isValidPasswordConfirm();
  }

  String? nameError;
  String? emailError;
  String? passwordError;
  String? errorConfirm;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Логотип
              const Center(
                child: Text(
                  "Casma",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Registrierung",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 24),

              // 🔹 Benutzername
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Benutzername",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextField(
                      controller: usernameController,
                      onEditingComplete: () {
                        if (!isValidName(usernameController.text)) {
                          setState(() {
                            nameError =
                                "Benutzername muss 3-20 Zeichen lang sein";
                          });
                          return;
                        }
                        setState(() {
                          nameError = null;
                        });
                      },
                      decoration: InputDecoration(
                        errorText: nameError,
                        hintText: "Chickenwing69",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🔹 Email
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "E-Mail Adresse",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextField(
                      controller: emailController,
                      onEditingComplete: () {
                        if (!isValidEmail(emailController.text)) {
                          setState(() {
                            emailError = "Ungültige E-Mail-Adresse";
                          });
                          return;
                        }
                        setState(() {
                          emailError = null;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "beispiel@gmail.com",
                        errorText: emailError,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🔹 Passwort
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Passwort",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      onEditingComplete: () {
                        if (!isValidPassword(passwordController.text)) {
                          setState(() {
                            passwordError = "Ungültiges Passwort";
                          });
                          return;
                        }
                        setState(() {
                          passwordError = null;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "************",
                        errorText: passwordError,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Tooltip(
                      message:
                          "Das Passwort muss mindestens 12 Zeichen lang sein und Großbuchstaben, Kleinbuchstaben, Zahlen und Sonderzeichen enthalten.",
                      child: Icon(
                        Icons.info_outline,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 🔹 Passwort bestätigen
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Passwort bestätigen",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextField(
                      controller: confirmController,
                      obscureText: !isConfirmVisible,
                      onEditingComplete: () {
                        setState(() {
                          if (confirmController.text ==
                              passwordController.text) {
                            errorConfirm = null;
                          } else {
                            errorConfirm = "Passwörter stimmen nicht überein";
                          }
                        });
                      },
                      decoration: InputDecoration(
                        errorText: errorConfirm,
                        hintText: "************",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConfirmVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmVisible = !isConfirmVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 🔹 Кнопка регистрации
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (!isValidData()) {
                      setState(() {
                        emailError = "Ungültige E-Mail-Adresse";
                        passwordError =
                            "Ungültiges Passwort oder Passwörter stimmen nicht überein";
                      });
                      return;
                    }
                    setState(() {
                      emailError = null;
                      passwordError = null;
                      errorConfirm = null;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Registrieren",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                    children: [
                      const TextSpan(text: "Du hast schon ein Konto? "),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.baseline,
                        baseline: TextBaseline.alphabetic,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Jetzt anmelden",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
