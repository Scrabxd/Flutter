import 'package:flutter/material.dart';
import 'package:fluttertest/providers/login_form_provider.dart';
import 'package:fluttertest/ui/input_decorations.dart';
import 'package:fluttertest/widgets/auth_background.dart';
import 'package:fluttertest/widgets/card_container.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({ Key? key}): super(key:key);



  @override
  State<LoginScreen> createState() => _LoginScreenState();


}


class _LoginScreenState extends State<LoginScreen>{


  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child:Column(children: [
          const SizedBox(height: 250),
          CardContainer(
            child: Column(
                children: [
                  Text('Login', style: Theme.of(context).textTheme.headlineLarge,),

                  const SizedBox(height: 20),

                  ChangeNotifierProvider(create: (_) => LoginFormProvider(),
                  child:_loginForm() ,
                  )
                ],
              )
            )
          ],
         )
        )
      )
    );
  }
  

}



class _loginForm extends StatelessWidget{

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  
  Widget build(BuildContext context){
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'example@mail.com', 
              labelText: 'Email',
              prefixIcon: Icons.alternate_email_rounded
              ),
              validator: (value) {

                String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '') ? null : 'Please input a valud email';

              },
              onChanged: (value) => loginForm.email = value,

            ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecorations.authInputDecoration(
              hintText: '*****', 
              labelText: 'Password',
              prefixIcon: Icons.lock_outline
              ),
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              validator: (value){

                return (value != null && value.length >= 6 ) ? null : 'The password must have a minimum of 6 characters';

              },
              onChanged: (value) => loginForm.password = value,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
            color: const Color(0xFF8D15D7),
            disabledColor: const Color(0xFFAAAAAA),
            elevation: 0,
            onPressed: loginForm.isLoading ? null : () async {

              FocusScope.of(context).unfocus();

              if(!loginForm.isValidForm()){
                return;
              }else{
                
                loginForm.isLoading = true;

                // TODO LOGIN AUTHENTICATION

                await Future.delayed(const Duration(seconds: 2));

                loginForm.isLoading = false;

                Navigator.pushReplacementNamed(context, 'home');


              }
            }, 
            child: Container(
              padding:  const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoading ? 'Wait' : 'Sign in',
                style: const TextStyle(
                  color: Color(0xFFEAEAEA)
                ),    
              ),
            ) 
          )
        ],
      ),
    );
  }

  void _login(){
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    print('Username $username');
    print('Password $password');
  }
}