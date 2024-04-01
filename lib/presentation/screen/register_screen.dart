import 'package:final_project_flutter_api/Domain/entities/user_registerentity.dart';
import 'package:final_project_flutter_api/presentation/provider/auth_provider.dart';
import 'package:final_project_flutter_api/presentation/provider/register_provider.dart';
import 'package:final_project_flutter_api/presentation/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:final_project_flutter_api/presentation/provider/auth_provider.dart';
import 'package:final_project_flutter_api/presentation/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UserRegisterScreen extends StatelessWidget {
  const UserRegisterScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create your account here!',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'You should register first',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _usernameController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the first name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'username',
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the last name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'password',
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              UserRegisterEntity userRegisterEntity = UserRegisterEntity(
                                username: _usernameController.text,
                                password: _passwordController.text,
                              );
                              
                
                              // await Provider.of<AuthProvider>(context, listen: false)
                              //     .register(context, _usernameController.text, _passwordController.text);
                              await Provider.of<UserRegisterProvider>(context, listen: false)
                                  .register(userRegisterEntity);
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                            backgroundColor: MaterialStateProperty.all(Colors.indigo),
                          ),
                          child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          WidgetsBinding.instance!.addPostFrameCallback((_) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          });
                        },
                        child: Text('Login', style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
