// import 'package:first_application/presentation/resources/assets_manager.dart';
// import 'package:first_application/presentation/resources/color_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// enum StateRendererType {
//   POPUP_LOADING_STATE,
//   POPUP_ERROR_STATE,

//   FULL_SCREEN_LOADING_STATE,
//   FULL_SCREEN_ERROR_STATE,

//   CONTENT_SCREEN_STATE,
//   EMPTY_SCREEN_STATE
// }

// class StateRenderer extends StatelessWidget {
//   final StateRendererType stateRendererType;
//   final String message;
//   final String title;
//   final Function? retryFunction;

//   const  StateRenderer(
//       {Key? key,
//       required this.stateRendererType,
//       String? message,
//       String? title,
//       required this.retryFunction})
//       : message = message ?? "Yükleniyor",
//         title = title ?? "",
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return _getStateWidget(context);
//   }

//   Widget _getStateWidget(BuildContext context) {
//     switch (stateRendererType) {
//       case StateRendererType.POPUP_LOADING_STATE:
//         return _getPopUpDialog(context, [
//           _getText("Yükleniyor...", context),
//           _getAnimatedLottie(JsonAssets.loading, context)
//         ]);

//       case StateRendererType.POPUP_ERROR_STATE:
//         return Container();

//       case StateRendererType.FULL_SCREEN_LOADING_STATE:
//         return Container();

//       case StateRendererType.FULL_SCREEN_ERROR_STATE:
//         return Container();

//       case StateRendererType.CONTENT_SCREEN_STATE:
//         return Container();

//       case StateRendererType.EMPTY_SCREEN_STATE:
//         return Container();

//       default:
//         return Container();
//     }
//   }

//   Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       elevation: 10,
//       child: Container(
//         decoration: BoxDecoration(
//             color: ColorManager.dark.withOpacity(0.8),
//             shape: BoxShape.rectangle,
//             boxShadow: const [
//               BoxShadow(
//                   color: Colors.black54, blurRadius: 12, offset: Offset(0, 12)),
//             ],
//             borderRadius: BorderRadius.circular(12)),
//         height: MediaQuery.of(context).size.height * 0.20,
//         // width: MediaQuery.of(context).size.width * 0.2,
//         child: _getDialogContent(context, children),
//       ),
//     );
//   }

//   _getDialogContent(BuildContext context, List<Widget> children) {
//     return Column(children: children);
//   }

//   Widget _getAnimatedLottie(String animationName, BuildContext context) {
//     return Expanded(
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height * 0.2,
//         width: MediaQuery.of(context).size.width * 0.4,
//         child: Lottie.asset(
//           animationName,
//         ),
//       ),
//     );
//   }

//   Widget _getText(String message, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16.0),
//       child: Text(
//         message,
//         style: Theme.of(context)
//             .textTheme
//             .bodyLarge!
//             .copyWith(color: Colors.white, fontSize: 15),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   _getItemsFullScreen(List<Widget> children) {
//     return Center(
//       child: Column(
//         children: children,
//       ),
//     );
//   }
// }
import 'package:first_application/presentation/resources/assets_manager.dart';
import 'package:first_application/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

enum StateRendererType {
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,

  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,

  CONTENT_SCREEN_STATE,
  EMPTY_SCREEN_STATE
  
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function? retryFunction;

  const StateRenderer(
      {Key? key,
      required this.stateRendererType,
      String? message,
      String? title,
      required this.retryFunction})
      : message = message ?? "Yükleniyor",
        title = title ?? "",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopUpDialog(context, [
          _getText("Loading...", context),
          _getAnimatedLoadingLottie(JsonAssets.loading, context)
        ]);

      case StateRendererType.POPUP_ERROR_STATE:
        return _getPopUpDialog(context, [
          _getText("Error", context),
          _getAnimatedErrorLottie(JsonAssets.error, context)
        ]);

      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsFullScreen(
            [_getText("Loading...", context), spinKit(context)], context);

      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsFullScreen([
          _getText("Error", context),
          _getAnimatedErrorLottie(JsonAssets.error, context)
        ], context);

      case StateRendererType.CONTENT_SCREEN_STATE:
        return Container();

      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsFullScreen([
          _getText("Not Found", context),
          _getAnimatedErrorLottie(JsonAssets.notFound, context)
        ], context);

      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 10,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.dark.withOpacity(0.8),
            shape: BoxShape.rectangle,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54, blurRadius: 12, offset: Offset(0, 12)),
            ],
            borderRadius: BorderRadius.circular(12)),
        height: MediaQuery.of(context).size.height * 0.4,
        // width: MediaQuery.of(context).size.width * 0.2,
        child: _getDialogContent(context, children),
      ),
    );
  }

  _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(children: children);
  }

  Widget _getAnimatedLoadingLottie(String animationName, BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Lottie.asset(
          animationName,
        ),
      ),
    );
  }

  Widget _getText(String message, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.white, fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }

  _getItemsFullScreen(List<Widget> children, BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.8),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: _getDialogContent(context, children),
        ),
      ),
    );
  }

  Widget _getAnimatedErrorLottie(String animationName, BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Lottie.asset(
          animationName,
        ),
      ),
    );
  }

  Widget spinKit(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: const SpinKitCircle(
        size: 80,
        color: Colors.white, //siyah ve beyaz olması arasında kaldım
      ),
    );
  }
}
