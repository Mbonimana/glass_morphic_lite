import 'dart:ui';
import 'package:flutter/material.dart';

/// A lightweight, performance-optimized widget that applies a glassmorphic
/// (frosted glass) effect to its child.
class GlassContainer extends StatelessWidget {
  /// The widget inside the glass container.
  final Widget child;

  /// Width of the container. If null, it will shrink to fit the child.
  final double? width;

  /// Height of the container. If null, it will shrink to fit the child.
  final double? height;

  /// The strength of the blur effect. Defaults to 10.0.
  /// Lower values perform better on older mobile GPUs.
  final double blur;

  /// The opacity of the glass overlay background. Defaults to 0.1.
  final int opacity;

  /// The primary color of the glass sheet. Defaults to [Colors.white].
  final Color color;

  /// An optional gradient for the glass background. If provided,
  /// [color] and [opacity] are ignored for the background sheet.
  final Gradient? gradient;

  /// The border radius of the container. Defaults to 16.0 on all corners.
  final BorderRadius borderRadius;

  /// An optional custom border. If null, a subtle, semi-transparent
  /// white border is automatically applied to mimic light reflecting off the edges.
  final BoxBorder? border;

  /// The inner padding of the container.
  final EdgeInsetsGeometry? padding;

  /// The outer margin of the container.
  final EdgeInsetsGeometry? margin;

  /// Align the child within the container.
  final AlignmentGeometry? alignment;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.blur = 10.0,
    this.opacity = 25,
    this.color = Colors.white,
    this.gradient,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.border,
    this.padding,
    this.margin,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            // 1. Apply the Gaussian Blur filter to the layer below
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: Container(
                  decoration: BoxDecoration(
                    color: gradient == null ? color.withAlpha(opacity) : null,
                    gradient: gradient,
                    borderRadius: borderRadius,
                  ),
                ),
              ),
            ),
            
            // 2. Apply a subtle border overlay to mimic glass edges
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: border ?? Border.all(
                    color: Colors.white.withAlpha(51),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            
            // 3. Render the content
            Padding(
              padding: padding ?? const EdgeInsets.all(16.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}