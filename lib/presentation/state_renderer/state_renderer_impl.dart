import 'package:first_application/presentation/state_renderer/state_renderer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMesagge();
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMesagge() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? "Yükleniyor";

  @override
  String getMesagge() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMesagge() => "";

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.CONTENT_SCREEN_STATE;
}

class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);

  @override
  String getMesagge() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.POPUP_LOADING_STATE) {
            showPopUp(context, getStateRendererType(), getMesagge());
            return contentScreenWidget;
          } else {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMesagge(),
                retryFunction: retryActionFunction);
          }
        }
      case ErrorState:
        {
          dissmisDialog(context);
          if (getStateRendererType() == StateRendererType.POPUP_ERROR_STATE) {
            showPopUp(context, getStateRendererType(), getMesagge());
            return contentScreenWidget;
          } else {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMesagge(),
                retryFunction: retryActionFunction);
          }
        }
      case ContentState:
        {
          dissmisDialog(context);
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            retryFunction: retryActionFunction,
            message: getMesagge(),
          );
        }
      default:
        return contentScreenWidget;
    }
  }

  dissmisDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  showPopUp(BuildContext context, StateRendererType stateRendererType,
      String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
              stateRendererType: stateRendererType,
              retryFunction: () {},
              message: message,
            )));
  }
}
