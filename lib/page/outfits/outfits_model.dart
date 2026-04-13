import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'outfits_widget.dart' show OutfitsWidget;
import 'package:flutter/material.dart';

class OutfitsModel extends FlutterFlowModel<OutfitsWidget> {
  ///  Local state fields for this page.

  String selectedTop = 'Choose a top';

  String selectedBottom = 'Choose a bottom';

  String selectedShoes = 'Choose shoes';

  ///  State fields for stateful widgets in this page.

  // State field(s) for OutfitName widget.
  FocusNode? outfitNameFocusNode;
  TextEditingController? outfitNameTextController;
  String? Function(BuildContext, String?)? outfitNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    outfitNameFocusNode?.dispose();
    outfitNameTextController?.dispose();
  }
}
