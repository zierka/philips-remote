import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/constants/ui_constants.dart';

import 'loading_indicator.dart';
import 'message.dart';

class MessageOverlay extends StatefulWidget {
  final Stream<Message> messageStream;

  MessageOverlay({
    Key? key,
    required this.messageStream,
  }) : super(key: key);

  @override
  _MessageOverlayState createState() => _MessageOverlayState();
}

class _MessageOverlayState extends State<MessageOverlay> {
  late StreamController<Message> _messageOutStreamController;
  Message? _currentOutMessage;

  late StreamController<Message> _messageHideStreamController;

  @override
  void initState() {
    super.initState();

    _initStreams();
  }

  _initStreams() {
    _messageOutStreamController = StreamController.broadcast();

    _messageOutStreamController.stream.listen((message) {
      _currentOutMessage = message;
    });

    _messageHideStreamController = StreamController();

    widget.messageStream.listen((message) {
      _messageOutStreamController.add(message);

      if (message.hidesAfter != null) {
        final hideMessage = Message(icon: null, message: null);
        hideMessage.previousMessage = message;
        _messageHideStreamController.add(hideMessage);
      }
    });

    _messageHideStreamController.stream.listen((message) async {
      final hidesAfter = message.previousMessage?.hidesAfter;

      if (hidesAfter != null) await Future.delayed(hidesAfter);

      if (_currentOutMessage?.message == message.previousMessage?.message) {
        _messageOutStreamController.add(message);
      }
    });
  }

  @override
  void dispose() {
    _messageOutStreamController.close();
    _messageHideStreamController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Message>(
      stream: _messageOutStreamController.stream,
      builder: (context, snapshot) {
        final message = snapshot.data;
        final show = snapshot.hasData && message?.message != null;
        return AnimatedOpacity(
          opacity: show ? 0.8 : 0,
          duration: Duration(milliseconds: 200),
          child: _buildOverlay(message),
        );
      },
    );
  }

  Widget _buildOverlay(Message? message) {
    if (message == null || message.message == null) return Container();

    return IgnorePointer(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Paddings.x2,
          vertical: Paddings.x2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: AppColors.greyDark,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            message.showLoading
                ? LoadingIndicator(size: LoadingIndicatorSize.small)
                : Icon(message.icon),
            SizedBox(width: Paddings.x2),
            Flexible(
              child: Text(
                message.message!,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
