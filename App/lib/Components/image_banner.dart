import 'package:flutter/material.dart';

Widget ImageBanner(_assetPath, _height)
{
  return Container(
      constraints: BoxConstraints.expand(
        height: _height,
      ),
      decoration: BoxDecoration(color: Colors.white), //funciona como placeholder se nao houvr imagem
      child: Image.asset(_assetPath, fit: BoxFit.cover)
  );
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size){
   var path = new Path();
   path.lineTo(0.0, size.height/3);
   path.lineTo(size.width + 200, 0.0);
   path.close();
   return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

speakerAvatar(String avatar){
  if(avatar != null)
      return BoxDecoration(
            image:
            DecorationImage(
              image:
              NetworkImage(avatar), //imagem do speaker
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(75)
            ),
            boxShadow: [
              BoxShadow( blurRadius: 7.0, color: Colors.black87)
            ]
        );

}