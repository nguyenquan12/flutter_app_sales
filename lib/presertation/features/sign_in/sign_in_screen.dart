import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login screen"),
      ),
      body: SignInContainerWidget(),
    );
  }
}

class SignInContainerWidget extends StatefulWidget {
  const SignInContainerWidget({super.key});

  @override
  State<SignInContainerWidget> createState() => _SignInContainerWidgetState();
}

class _SignInContainerWidgetState extends State<SignInContainerWidget> {
  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  var isPassVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        children: [
          Expanded(
              flex: 2, child: Image.asset("assets/images/ic_hello_food.png")),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildPhoneTextField(),
                  _buildPasswordTextField(),
                  _buildButtonSignIn(),
                ],
              ),
            ),
          ),
          Expanded(child: _buildTextSignUp())
        ],
      ),
    ));
  }

  Widget _buildTextSignUp() {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account!"),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/sign-up");
              },
              child: Text("Sign Up",
                  style: TextStyle(
                      color: Colors.red, decoration: TextDecoration.underline)),
            )
          ],
        ));
  }

  Widget _buildPhoneTextField() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        maxLines: 1,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          fillColor: Colors.black12,
          filled: true,
          hintText: "Email",
          labelStyle: TextStyle(color: Colors.blue),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          prefixIcon: Icon(Icons.email, color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        maxLines: 1,
        controller: _passController,
        obscureText: isPassVisible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Colors.black12,
          filled: true,
          hintText: "PassWord",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 0, color: Colors.black12)),
          labelStyle: TextStyle(color: Colors.blue),
          prefixIcon: Icon(Icons.lock, color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildButtonSignIn() {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: () {
            // var email = _emailController.text.toString();
            // var password = _passController.text.toString();
            // bloc.eventSink.add(SignInEvent(email: email, password: password));
          },
          child: Text("Sign in"),
        ));
  }
}
