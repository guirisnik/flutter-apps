import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';

enum From {
  user,
  contact,
  system
}

class Message extends StatelessWidget {
  final String text;
  final String sender;
  final From from;
  final double fontSize;

  Message({
    @required this.text,
    @required this.from,
    this.sender,
    this.fontSize,
  });

  String _formatSender() => this.sender.split('@')[0];

  static const Map<From, CrossAxisAlignment> _textAlignMap = {
    From.user: CrossAxisAlignment.end,
    From.contact: CrossAxisAlignment.start,
    From.system: CrossAxisAlignment.center,
  };

  static const Map<From, Alignment> _alignmentMap = {
    From.user: Alignment.bottomRight,
    From.contact: Alignment.bottomLeft,
    From.system: Alignment.bottomCenter,
  };

  static Map<From, Color> _backgroundColorMap = {
    From.user: Colors.teal.shade900,
    From.contact: Colors.grey.shade800,
    From.system: Colors.black,
  };

  static Map<From, Color> _senderColorMap = {
    From.user: Colors.orange,
    From.contact: Colors.greenAccent[400],
    From.system: Colors.amber,
  };

  static Map<From, Color> _textColorMap = {
    From.user: Colors.white,
    From.contact: Colors.white,
    From.system: Colors.amber,
  };

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _alignmentMap[from],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: _backgroundColorMap[from],
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Column(
            crossAxisAlignment: _textAlignMap[from],
            children: [
              sender != null && sender != SYSTEM_SENDER 
              ? Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  _formatSender(),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: _senderColorMap[from],
                    fontSize: fontSize != null ? fontSize : 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ) : SizedBox(),
              Text(
                text,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: _textColorMap[from],
                  fontSize: fontSize != null ? fontSize : 18.0,

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}