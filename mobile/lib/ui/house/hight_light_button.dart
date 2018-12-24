import 'package:flutter/material.dart';

class HightLightButton extends StatefulWidget {

  final String _normalIcon;
  final String _pressedIcon;
  final Function _onPressed;

  HightLightButton(this._onPressed,this._normalIcon,this._pressedIcon,);

  @override
  _HightLightButtonState createState() => _HightLightButtonState();
}

class _HightLightButtonState extends State<HightLightButton> {  

  bool _isPressed = false;
  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(child:_GestureWidget() ,onTapDown:onWidgetTapDown,onTapUp:onWidgetTapUp);     
  }

  void onWidgetTapDown(TapDownDetails details)
  {
    setState(() {
          _isPressed = true;
        });
    if(widget._onPressed != null) widget._onPressed();
  }

  void onWidgetTapUp(TapUpDetails details)
  {
    setState(() {
      _isPressed = false;
    });
  }
  
  Widget _GestureWidget()
  {
    return  Container(width: 50,height: 25,child:_buildImag());
  }

  Widget _buildImag()
   {
      return _isPressed ?Image.asset(widget._normalIcon ,fit: BoxFit.cover,):Image.asset(widget._pressedIcon,fit: BoxFit.cover,);
  }
}