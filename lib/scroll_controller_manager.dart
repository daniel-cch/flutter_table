import 'package:flutter/material.dart';

class ScrollControllerManager {
  ScrollControllerManager();

  final List<ScrollController> _registeredControllers = [];
  ScrollController? _controller;
  bool _activeController = false;

  void registerController(ScrollController controller) {
    _registeredControllers.add(controller);
  }

  void unregisterController(ScrollController controller) {
    _registeredControllers.remove(controller);
  }

  void processNotification(
    ScrollNotification notification,
    ScrollController sender,
  ) {
    if (notification is ScrollStartNotification && !_activeController) {
      _controller = sender;
      _activeController = true;
      return;
    }

    if (identical(sender, _controller) && _activeController) {
      if (notification is ScrollEndNotification) {
        _controller = null;
        _activeController = false;
        return;
      }

      if (notification is ScrollUpdateNotification) {
        for (var controller in _registeredControllers) {
          if (!identical(_controller, controller)) {
            if (controller.hasClients) {
              controller.jumpTo(_controller?.offset ?? 0);
            }
          }
        }
        return;
      }
    }
  }
}
