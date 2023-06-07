import 'package:book_tickets_app/screens_authenticate/signInAnon.dart';
import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  final Function togggleView;
  const LoginScreen({Key? key, required this.togggleView}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  String _errorMessage = '';
  var _key = GlobalKey<FormState>();

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  void _handleSubmit() async {
    if (_key.currentState?.validate() ?? false) {
      _key.currentState?.save();
      _key.currentState?.reset();
      myFocusNode.requestFocus();

      try {

      } catch (e) {

      }
    } else {
      print('Invalid form');
    }
  }

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  focusNode: myFocusNode,
                  onSaved: (v) {
                    email = v ?? '';
                  },
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please enter your email';
                    }
                    else if(EmailValidator.validate(v) == false)
                      {
                        return 'Enter a valid email!';
                      }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Your email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (v) {
                    password = v ?? '';
                  },
                  validator: (v) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    var passNonNullValue = v ?? "";
                    if (passNonNullValue.isEmpty) {
                      return ("Password is required");
                    } else if (passNonNullValue.length < 6) {
                      return ("Password Must be more than 5 characters");
                    } else if (!regex.hasMatch(passNonNullValue)) {
                      return ("Password should contain upper, lower,digit, and special character");
                    }
                    return null;
                  },
                  obscureText: _isObscure,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),
                ),
                if (_errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(55)),
                  onPressed: _handleSubmit,
                  child: Text('Login'),
                ),
                SizedBox(
                  height: 25,
                ),
                Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    children: [
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {
                            widget.togggleView();
                          },
                          child: Text(
                            "Register here",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: " | ",
                      ),
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => SignIn()));
                          },
                          child: Text(
                            "Sign in anonymous",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
