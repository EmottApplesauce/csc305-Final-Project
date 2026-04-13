import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:csc305_final_project/flutter_flow/flutter_flow_icon_button.dart';
import 'package:csc305_final_project/flutter_flow/flutter_flow_widgets.dart';
import 'package:csc305_final_project/flutter_flow/flutter_flow_theme.dart';
import 'package:csc305_final_project/index.dart';
import 'package:csc305_final_project/main.dart';
import 'package:csc305_final_project/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:csc305_final_project/backend/firebase/firebase_config.dart';
import 'package:csc305_final_project/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('US4 Golden path', () {
    testWidgets('Successful Clothing Upload', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'DDDDRIZY223@gmail.com', password: 'Zimber@246');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: BaseWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('Container_9xjj')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(const ValueKey('StarRow')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.enterText(
          find.byKey(const ValueKey('createPost_l50f')), 'Shirt');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(const ValueKey('Button_e4ir')));
    });

    testWidgets('Successful Clothing stored in closet',
        (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'DDDDRIZY223@gmail.com', password: 'Zimber@246');
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: MyApp(
          entryPage: BaseWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('Container_9xjj')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(const ValueKey('StarRow')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.enterText(find.byKey(const ValueKey('Name_7938')), 'Shirt');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(const ValueKey('Top')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(const ValueKey('Button_e4ir')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(const ValueKey('Column_xapa')));
    });

    testWidgets('Successful Weather', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('Text_e8j0')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.enterText(
          find.byKey(const ValueKey('SignUpEmail_34qt')), 'test@gmail.com');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.enterText(
          find.byKey(const ValueKey('SignUpPass_1unp')), 'Zimber@246');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.enterText(
          find.byKey(const ValueKey('Confrim_baw4')), 'Zimber@246');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(const ValueKey('Button_nfto')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.enterText(
          find.byKey(const ValueKey('Name_hutz')), 'Automation Testing');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.enterText(
          find.byKey(const ValueKey('CityforAi_d98p')), 'providence');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(const ValueKey('FinshProfile_jgz2')));
    });

    testWidgets('Successful Account Creation', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => FFAppState(),
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.enterText(find.byKey(const ValueKey('SignUpEmail_34qt')),
          'test305sda@gmail.com');
      await tester.enterText(
          find.byKey(const ValueKey('SignUpPass_1unp')), 'Zimber@246');
      await tester.enterText(
          find.byKey(const ValueKey('Confrim_baw4')), 'Zimber@246');
      await tester.tap(find.byKey(const ValueKey('Button_nfto')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    });
  });

  testWidgets('US 2 Login', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('EmailLogin_a2vw')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(const ValueKey('PasswordLogin_xhtv')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 2000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 2000),
    );
    await tester.tap(find.byKey(const ValueKey('Button_ukx5')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 5000),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 5000),
    );
    expect(find.text('bottom'), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
