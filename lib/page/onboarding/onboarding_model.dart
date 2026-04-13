import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataI2t = false;
  FFUploadedFile uploadedLocalFile_uploadDataI2t =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataI2t = '';

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for CityforAi widget.
  FocusNode? cityforAiFocusNode;
  TextEditingController? cityforAiTextController;
  String? Function(BuildContext, String?)? cityforAiTextControllerValidator;
  // Stores action output result for [Backend Call - API (GetWeather)] action in FinshProfile widget.
  ApiCallResponse? weatherApiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    cityforAiFocusNode?.dispose();
    cityforAiTextController?.dispose();
  }
}
