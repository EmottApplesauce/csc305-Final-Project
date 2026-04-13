import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'authentication_page_widget.dart' show AuthenticationPageWidget;
import 'package:flutter/material.dart';

class AuthenticationPageModel
    extends FlutterFlowModel<AuthenticationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SignUpEmail widget.
  FocusNode? signUpEmailFocusNode;
  TextEditingController? signUpEmailTextController;
  String? Function(BuildContext, String?)? signUpEmailTextControllerValidator;
  // State field(s) for SignUpPass widget.
  FocusNode? signUpPassFocusNode;
  TextEditingController? signUpPassTextController;
  late bool signUpPassVisibility;
  String? Function(BuildContext, String?)? signUpPassTextControllerValidator;
  // State field(s) for Confrim widget.
  FocusNode? confrimFocusNode;
  TextEditingController? confrimTextController;
  late bool confrimVisibility;
  String? Function(BuildContext, String?)? confrimTextControllerValidator;

  @override
  void initState(BuildContext context) {
    signUpPassVisibility = false;
    confrimVisibility = false;
  }

  @override
  void dispose() {
    signUpEmailFocusNode?.dispose();
    signUpEmailTextController?.dispose();

    signUpPassFocusNode?.dispose();
    signUpPassTextController?.dispose();

    confrimFocusNode?.dispose();
    confrimTextController?.dispose();
  }
}
