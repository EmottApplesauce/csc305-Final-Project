import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'nps4_widget.dart' show Nps4Widget;
import 'package:flutter/material.dart';

class Nps4Model extends FlutterFlowModel<Nps4Widget> {
  ///  Local state fields for this page.

  int? selectedScore = -1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for npsTxtField widget.
  FocusNode? npsTxtFieldFocusNode;
  TextEditingController? npsTxtFieldTextController;
  String? Function(BuildContext, String?)? npsTxtFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    npsTxtFieldFocusNode?.dispose();
    npsTxtFieldTextController?.dispose();
  }
}
