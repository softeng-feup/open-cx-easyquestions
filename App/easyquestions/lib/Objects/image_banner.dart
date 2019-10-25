import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget
{
  final String _assetPath;
  final double _height;

  ImageBanner(this._assetPath, this._height);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      constraints: BoxConstraints.expand(
        height: _height,
      ),
      decoration: BoxDecoration(color: Colors.white), //funciona como placeholder se nao houvr imagem
      child: Image.asset(_assetPath, fit: BoxFit.cover)
    );

  }
}