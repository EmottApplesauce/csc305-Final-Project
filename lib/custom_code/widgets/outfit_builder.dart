// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

class OutfitBuilder extends StatefulWidget {
  const OutfitBuilder({
    super.key,
    this.width,
    this.height,
    this.topLabel,
    this.bottomLabel,
    this.shoesLabel,
    this.topImage, // NEW
    this.bottomImage, // NEW
    this.shoesImage, // NEW
    this.onTopPressed,
    this.onBottomPressed,
    this.onShoesPressed,
  });

  final double? width;
  final double? height;
  final String? topLabel;
  final String? bottomLabel;
  final String? shoesLabel;
  final String? topImage; // NEW
  final String? bottomImage; // NEW
  final String? shoesImage; // NEW

  final Future Function()? onTopPressed;
  final Future Function()? onBottomPressed;
  final Future Function()? onShoesPressed;

  @override
  State<OutfitBuilder> createState() => _OutfitBuilderState();
}

class _OutfitBuilderState extends State<OutfitBuilder> {
  final Color _bg = const Color(0xFF0D0D1A);
  final Color _surface = const Color(0xFF161630);
  final Color _accent = const Color(0xFF6C5CE7);
  final Color _textMuted = const Color(0xFF7B79A8);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: _bg,
      child: Column(
        children: [
          _buildSlot(
            category: "TOP",
            title: widget.topLabel,
            imageUrl: widget.topImage, // Pass URL
            emoji: "👕",
            placeholder: "Choose a top",
            onTap: widget.onTopPressed,
          ),
          _buildConnector(),
          _buildSlot(
            category: "BOTTOM",
            title: widget.bottomLabel,
            imageUrl: widget.bottomImage, // Pass URL
            emoji: "👖",
            placeholder: "Choose a bottom",
            onTap: widget.onBottomPressed,
          ),
          _buildConnector(),
          _buildSlot(
            category: "SHOES",
            title: widget.shoesLabel,
            imageUrl: widget.shoesImage, // Pass URL
            emoji: "👟",
            placeholder: "Choose shoes",
            onTap: widget.onShoesPressed,
          ),
        ],
      ),
    );
  }

  Widget _buildConnector() {
    return Container(
      width: 1,
      height: 16,
      color: _textMuted.withOpacity(0.2),
    );
  }

  Widget _buildSlot({
    required String category,
    String? title,
    String? imageUrl, // Added parameter
    required String emoji,
    required String placeholder,
    Future Function()? onTap,
  }) {
    bool isEmpty = title == null || title.isEmpty;
    bool hasImage = imageUrl != null && imageUrl.isNotEmpty;

    return GestureDetector(
      onTap: () async {
        if (onTap != null) {
          await onTap();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isEmpty
                ? _textMuted.withOpacity(0.3)
                : _accent.withOpacity(0.5),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: _bg,
                borderRadius: BorderRadius.circular(16),
              ),
              clipBehavior: Clip.antiAlias, // Ensures image corners are rounded
              child: Center(
                child: hasImage
                    ? Image.network(
                        imageUrl,
                        width: 54,
                        height: 54,
                        fit: BoxFit.cover,
                        // Error handling if image fails to load
                        errorBuilder: (context, error, stackTrace) =>
                            Text(emoji, style: const TextStyle(fontSize: 24)),
                      )
                    : Text(emoji, style: const TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: GoogleFonts.dmSans(
                      color: _textMuted,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Text(
                    isEmpty ? placeholder : title!,
                    style: GoogleFonts.dmSans(
                      color: isEmpty ? _textMuted : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (isEmpty)
                    Text(
                      "Tap to browse your closet",
                      style: GoogleFonts.dmSans(
                        color: _textMuted.withOpacity(0.7),
                        fontSize: 11,
                      ),
                    ),
                ],
              ),
            ),
            Icon(
              isEmpty ? Icons.add : Icons.close,
              color: isEmpty ? _accent : _textMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
