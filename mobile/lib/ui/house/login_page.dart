import 'package:flutter/material.dart';
import 'package:inkino/assets.dart';
import 'package:inkino/ui/house/app_main.dart';
import 'package:inkino/ui/house/hight_light_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController userNameController = new TextEditingController(text: "");

  TextEditingController passwordController =
      new TextEditingController(text: "");
  Widget _buildTopIcon()
  {
    return Container(height: 200,width: 100,);
  }

  Widget _buildUserName()
  {
    return LoginInput(userNameController,"请输入用户名");
  }

  Widget _buildPassword()
  {
    return LoginPasswordInput(passwordController,"请输入密码");
  }

  Widget _buildLoginButton()
  {
    return  HightLightButton(onLoginPressed, ImageAssets.loginButtonPressedIcon,ImageAssets.loginButtonNormalIcon);   
  }


  void onLoginPressed()
  {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AppMainPage()),
  );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) 
  {
    final backgroundImage = Image.asset(
      ImageAssets.backgroundImage,
      fit: BoxFit.cover,
    );

    final bodycontent = Form(child: Column(
      children: [
        _buildTopIcon(),
        _buildUserName(),
        _buildPassword(),
        _buildLoginButton()
      ],
    ));

    final content = Scaffold(
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(),
      ),
      body: bodycontent
      );

    return  Stack(
      fit: StackFit.expand,
      children: [
        backgroundImage,
        content,
      ],
    );

  }
}

class LoginInput extends StatelessWidget 
{
  final TextEditingController _userNameController;
  final String _hintString;
  LoginInput(this._userNameController,this._hintString,);

  @override
  Widget build(BuildContext context) {
    return Container(child: Row(     
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Expanded(
        flex: 2,
        child:  
      Container(        
        child: Center(child: 
      Padding(padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
      child:  Image.asset(
       ImageAssets.userNameIcon,
      fit: BoxFit.scaleDown,
      width: 88,height: 31,
      alignment: Alignment.centerLeft,
      ),))),
          ) ,
     Expanded(
       flex: 4,
       child: Container( 
       color: Colors.white,
       alignment: Alignment.centerLeft,
          child: 
          TextField(
            style: TextStyle(fontSize: 20),
            controller: _userNameController,
             decoration: InputDecoration.collapsed(
               hintText: _hintString,
               hintStyle: TextStyle(fontSize: 18)
              )),
          )
    ), Expanded( flex:1, child: Container(width: 30,),)
]));
  }
}


class LoginPasswordInput extends StatelessWidget 
{
  final TextEditingController _userNameController;
  final String _hintString;
  LoginPasswordInput(this._userNameController,this._hintString,);

  @override
  Widget build(BuildContext context) {
    return Container(child: Row(     
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Expanded(
        flex: 2,
        child:  
      Container(        
        child: Center(child: 
      Padding(padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
      child:  Image.asset(
       ImageAssets.passwordIcon,
      fit: BoxFit.contain,
      width: 48,height: 31,
      alignment: Alignment.centerLeft,
      ),))),
          ) ,
     Expanded(
       flex: 4,
       child: Container( 
       color: Colors.white,
       alignment: Alignment.centerLeft,
          child: 
          TextField(
            obscureText: true,
            style: TextStyle(fontSize: 20),
            controller: _userNameController,
             decoration: InputDecoration.collapsed(
               hintText: _hintString,
               hintStyle: TextStyle(fontSize: 18)
              )),
          )
    ), Expanded( flex:1, child: Container(width: 30,),)
]));
  }
}

