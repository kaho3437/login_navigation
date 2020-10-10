import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_navigation/app_model.dart';
import 'package:login_navigation/second_screen.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 250,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'User ID',
                    //icon: Icon(Icons.person),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    //icon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: const Text('LOGIN'),
                  onPressed: () => _onPressedLogin(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressedLogin() {
    // Show a progress dialog
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          child: Padding(padding: const EdgeInsets.symmetric(vertical: 25),
            child:
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 20,),
              Text('Please wait...'),
            ],
          ),
          ),
        );
      },
    );
    var model = context.read<AppModel>();
    model.login().then((loginOk) {
      if (loginOk) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          SecondScreen.routeName,
          (_) => false,
        );
      } else {
        Navigator.pop(context); // Close the progress dialog
      }
    });
  }
}
