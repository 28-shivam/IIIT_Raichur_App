import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iiit_raichur/presentation/blocs/auth/auth_bloc.dart';
import 'package:iiit_raichur/presentation/blocs/auth/auth_state.dart';

import '../../../blocs/auth/auth_event.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.deepPurple.shade900],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 3D Illustration Placeholder
                  // Image.asset("assets/login_page.png", height: 150),
                  Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/login_page.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Welcome Back!",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 30),

                  // Username Input
                  _buildTextField(
                    controller: usernameController,
                    hintText: "Username",
                    icon: Icons.person,
                  ),

                  SizedBox(height: 15),

                  // Password Input
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return _buildTextField(
                        controller: passwordController,
                        hintText: "Password",
                        icon: Icons.lock,
                        obscureText: !state.isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            state.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            context.read<AuthBloc>().add(
                              TogglePasswordVisibility(),
                            );
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 10),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.poppins(color: Colors.white70),
                    ),
                  ),

                  SizedBox(height: 20),

                  // Sign In Button
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return state.isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 100,
                          ),
                        ),
                        onPressed: () {
                          context.read<AuthBloc>().add(
                            LoginSubmitted(
                              usernameController.text,
                              passwordController.text,
                            ),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 15),

                  Text(
                    "or continue with",
                    style: GoogleFonts.poppins(color: Colors.white70),
                  ),

                  SizedBox(height: 10),

                  // Google Sign-In Button
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      // TODO: Implement Google Sign-In
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
