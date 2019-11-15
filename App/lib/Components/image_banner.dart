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
