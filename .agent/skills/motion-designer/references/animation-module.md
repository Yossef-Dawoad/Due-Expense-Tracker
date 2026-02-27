# Animation Module Reference

Complete documentation of the project's animation components.

---

## Core Utilities

### AnimationDurations

Standardized timing constants for consistent animation behavior.

```dart
import 'package:my_app/animation/animation.dart';

AnimationDurations.rapid    // 100ms — Tap feedback, intense micro-interactions
AnimationDurations.short    // 200ms — Tooltips, hover states, minor changes
AnimationDurations.medium   // 350ms — Page transitions, modals, sliding elements
AnimationDurations.long     // 500ms — Large layout changes, orchestrated sequences
AnimationDurations.longer   // 700ms — Hero animations, splash screens
```

### AnimationCurves

Standardized easing curves for natural motion feel.

```dart
AnimationCurves.standard    // easeInOut — Opacity, color, generic scaling
AnimationCurves.decelerate  // easeOutCubic — Slide-ins, pop-ups, entrances
AnimationCurves.accelerate  // easeInCubic — Slide-outs, dismissals
AnimationCurves.bounce      // elasticOut — Playful, success indicators
```

### AutoDisposeAnimationControllerMixin

Mixin for automatic controller lifecycle management.

```dart
class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin, AutoDisposeAnimationControllerMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = createController(
      vsync: this,
      duration: AnimationDurations.medium,
    );
  }
  // No need to override dispose() — automatic!
}
```

### AnimationControllerExtension

Convenience methods for common animation patterns:

```dart
_controller.fadeIn(Curves.easeInOut)   // 0.0 → 1.0
_controller.fadeOut(Curves.easeInOut)  // 1.0 → 0.0
_controller.slideIn(Offset(-1, 0), Curves.decelerate)
_controller.scale(0.8, 1.0, Curves.bounce)
```

---

## Animation Widgets

### FadeInAnimation

Smooth fade-in for content appearance.

```dart
FadeInAnimation(
  delay: Duration(milliseconds: 100),
  duration: AnimationDurations.medium,  // Default
  curve: Curves.easeInOut,
  child: Text("Hello World"),
)
```

**Use for**: Async content, image loading, reducing visual pop-in.

**Accessibility**: Automatically respects `MediaQuery.disableAnimations`.

---

### SlideInAnimation

Directional entrance animations using offset.

```dart
SlideInAnimation(
  beginOffset: const Offset(0, 0.1),  // Slide up slightly
  delay: Duration(milliseconds: 50),
  duration: AnimationDurations.medium,  // Default
  curve: Curves.easeOutCubic,
  child: Card(...),
)
```

**Common offsets**:
- `Offset(0, 0.1)` — Slide up (default)
- `Offset(-1, 0)` — Slide from left
- `Offset(1, 0)` — Slide from right
- `Offset(0, -0.1)` — Slide down

**Use for**: Page transitions, list items, modal entrances.

**Accessibility**: Automatically respects `MediaQuery.disableAnimations`.

---

### ClassicSlideWithFadeInAnimation

Combined slide and fade for premium entrances.

```dart
ClassicSlideWithFadeInAnimation(
  beginOffset: const Offset(0, 0.2),  // Default
  duration: AnimationDurations.medium,
  delay: Duration.zero,
  curve: Curves.easeOut,
  child: MyContent(),
)
```

**Use for**: Standard premium entry effect for main content.

---

### StaggeredListAnimation

Cascading animations for list items.

```dart
StaggeredListAnimation(
  staggerDuration: Duration(milliseconds: 50),  // Delay between items
  itemDuration: AnimationDurations.medium,
  delay: Duration(milliseconds: 100),
  direction: Axis.vertical,
  children: [Item1(), Item2(), Item3()],
)
```

**Use for**: Lists, grids, sequential content reveals.

**Accessibility**: Automatically respects `MediaQuery.disableAnimations`.

---

### ScaleFeedback

Tactile scale effect for interactive elements.

```dart
ScaleFeedback(
  onTap: () => print("Tapped!"),
  minScale: 0.95,  // 95% size when pressed
  duration: AnimationDurations.rapid,
  child: Card(...),
)
```

**Use for**: Cards, buttons without built-in feedback, tappable list items.

---

### ShakeAnimation

Side-to-side shake for errors or attention.

```dart
ShakeAnimation(
  controller: _shakeController,  // Call .forward() to trigger
  offset: 10.0,
  child: TextField(...),
)
```

**Performance**: Wrapped in `RepaintBoundary` automatically.

**Use for**: Invalid form submission, action denied, attention grabbing.

---

### PulseAnimation

Continuous pulsing for attention.

```dart
PulseAnimation(
  minScale: 0.97,
  maxScale: 1.03,
  duration: Duration(milliseconds: 1500),
  autoStart: true,
  child: FloatingActionButton(...),
)
```

**Performance**: Wrapped in `RepaintBoundary` automatically.

**Use for**: CTAs, recording indicators, "live" badges.

**Accessibility**: Automatically respects `MediaQuery.disableAnimations`.

---

### ShimmerLoading

Skeleton loading shimmer effect.

```dart
ShimmerLoading(
  isLoading: true,
  baseColor: Color(0xFFE0E0E0),
  highlightColor: Color(0xFFF5F5F5),
  child: Container(width: 100, height: 100),
)
```

**Performance**: Wrapped in `RepaintBoundary` automatically.

**Use for**: Skeleton screens, image placeholders, latency masking.

**Accessibility**: Automatically respects `MediaQuery.disableAnimations`.

---

### AnimatedCounter

Counting number animation with slide transition.

```dart
AnimatedCounter(
  value: 1234,
  duration: AnimationDurations.medium,
  style: TextStyle(fontSize: 24),
)
```

**Use for**: Statistics, scores, cart counts, metrics.

---

### FlipCard

3D card flip interaction.

```dart
FlipCard(
  front: Card(child: Text("Question")),
  back: Card(child: Text("Answer")),
  duration: Duration(milliseconds: 400),
  flipOnTap: true,
  startWithFrontSide: true,
  onFlip: () => print("Flipped!"),
)
```

**Use for**: Reveal effects, flashcards, settings toggles.

**Accessibility**: Automatically respects `MediaQuery.disableAnimations`.

---

### AnimatedGradientBackground

Animated gradient backgrounds cycling through color sets.

```dart
AnimatedGradientBackground(
  colorSets: [
    [Colors.blue, Colors.purple],
    [Colors.red, Colors.orange],
  ],
  duration: Duration(seconds: 5),
  child: Scaffold(...),
)
```

**Performance**: Wrapped in `RepaintBoundary` automatically.

**Use for**: Ambient motion, onboarding screens, hero sections.

**Accessibility**: Automatically respects `MediaQuery.disableAnimations`.

---

### BreathingAnimation

Guided breathing cycle with expand → hold → contract → pause phases.

```dart
BreathingAnimation(
  expandDuration: Duration(seconds: 4),
  holdDuration: Duration(seconds: 2),
  contractDuration: Duration(seconds: 4),
  minScale: 0.8,
  maxScale: 1.2,
  child: CircleAvatar(radius: 50),
)
```

**Performance**: Wrapped in `RepaintBoundary` automatically.

**Use for**: Guided breathing exercises, meditation UI, calming loaders.

**Accessibility**: Automatically respects `MediaQuery.disableAnimations`.

---

### AnimatedDashboardCard

Example widget demonstrating animation composition.

```dart
AnimatedDashboardCard(
  title: "Steps",
  value: "5,432",
  icon: Icons.directions_walk,
  gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlue]),
  onTap: () {},
)
```

**Use for**: Dashboard grids, card collections, reference implementation.

---

### AnimatedProgressBar

Animated linear progress bar.

```dart
AnimatedProgressBar(
  progress: 0.75,  // 0.0 to 1.0
  progressColor: Color(0xFF4FD1C5),
  backgroundColor: Color(0xFFE2E8F0),
  height: 8.0,
  duration: Duration(milliseconds: 300),
)
```

**Use for**: Progress bars, loading states, skill bars.

---

### AnimatedCircularProgress

Animated circular progress indicator.

```dart
AnimatedCircularProgress(
  progress: 0.5,  // 0.0 to 1.0
  size: 100,
  strokeWidth: 10.0,
  progressColor: Color(0xFF4FD1C5),
  duration: Duration(milliseconds: 300),
  child: Text("50%"),
)
```

**Performance**: Wrapped in `RepaintBoundary` automatically.

**Use for**: Workout timers, meditation progress, download status.

---

## Accessibility Guidelines

All animation widgets should support reduced motion preferences:

- ✅ `FadeInAnimation` — Respects `disableAnimations`
- ✅ `SlideInAnimation` — Respects `disableAnimations`
- ✅ `StaggeredListAnimation` — Respects `disableAnimations`
- ✅ `PulseAnimation` — Respects `disableAnimations`
- ✅ `ShimmerLoading` — Respects `disableAnimations`
- ✅ `FlipCard` — Respects `disableAnimations`
- ✅ `AnimatedGradientBackground` — Respects `disableAnimations`
- ✅ `BreathingAnimation` — Respects `disableAnimations`

---

## Performance Checklist

- [ ] Profile with Flutter DevTools
