import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'changepassword_widget.dart' show ChangepasswordWidget;
import 'package:flutter/material.dart';

class ChangepasswordModel extends FlutterFlowModel<ChangepasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Current widget.
  FocusNode? currentFocusNode;
  TextEditingController? currentTextController;
  late bool currentVisibility;
  String? Function(BuildContext, String?)? currentTextControllerValidator;
  // State field(s) for Newpass widget.
  FocusNode? newpassFocusNode;
  TextEditingController? newpassTextController;
  late bool newpassVisibility;
  String? Function(BuildContext, String?)? newpassTextControllerValidator;
  // State field(s) for ConNewpass widget.
  FocusNode? conNewpassFocusNode;
  TextEditingController? conNewpassTextController;
  late bool conNewpassVisibility;
  String? Function(BuildContext, String?)? conNewpassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    currentVisibility = false;
    newpassVisibility = false;
    conNewpassVisibility = false;
  }

  @override
  void dispose() {
    currentFocusNode?.dispose();
    currentTextController?.dispose();

    newpassFocusNode?.dispose();
    newpassTextController?.dispose();

    conNewpassFocusNode?.dispose();
    conNewpassTextController?.dispose();
  }
}
