# Due Expense Tracker: UI & Theming Guide

Welcome to the UI and Theming documentation. This project uses a strictly tokenized design system powered by a `design-tokens.json` source-of-truth. We integrate these tokens natively into Flutter's `ThemeData` and `ThemeExtension` to provide a friction-free, robust, and beautiful development experience.

This guide outlines best practices, how to access our design tokens, and expectations for building correctly-styled UI components.

---

## 1. Core Philosophy: Zero Hardcoding
**Rule #1: Never hardcode a color, size, text style, or shadow.**
If you are typing a hex code (`0xFF...`), `Colors.red`, `TextStyle(fontSize: 14)`, or `SizedBox(height: 15)`, **you are doing it wrong.**

Everything must be routed through our semantic extensions available on the `BuildContext`.

---

## 2. Accessing the Design Tokens
We have added convenient getter extensions to the `BuildContext` so you can access tokens easily anywhere in the widget tree.

### 🎨 Colors (`context.kitColors`)
We use semantic naming so the intention is clear:
```dart
// Backgrounds
Container(color: context.kitColors.bgSurface) // Cards, sheets, dialogs
Container(color: context.kitColors.bgBase) // Main scaffold background

// Text
Text("Hello", style: TextStyle(color: context.kitColors.textPrimary))
Text("Caption", style: TextStyle(color: context.kitColors.textSecondary))

// Semantics
Icon(Icons.check, color: context.kitColors.semanticPositive) // Green
Icon(Icons.error, color: context.kitColors.semanticNegative) // Red
```

### 🔤 Typography (`context.textStyles`)
All Font weights, line heights, and letter spacing are baked into these tokens:
```dart
Text("Balance", style: context.textStyles.headingLG)
Text("Transaction details", style: context.textStyles.bodyMD)
Text("12 days left", style: context.textStyles.caption)
```
*Note: If you need to change the color of a text style, use `.copyWith(color: ...)`.*

### 📏 Spacing (`context.spacing`)
A 4px-based underlying scale combined with semantic usages:
```dart
// Explicit scale
SizedBox(height: context.spacing.s4) // 16px
SizedBox(height: context.spacing.s2) // 8px

// Semantic spacing (Prefer this for layouts)
Padding(padding: EdgeInsets.all(context.spacing.cardPadding))
SizedBox(height: context.spacing.sectionGap)
```

### 🔲 Border Radius (`context.borderRadius`)
```dart
Container(
  decoration: BoxDecoration(
    borderRadius: context.borderRadius.card, // Semantic
    // or
    borderRadius: context.borderRadius.md,   // Absolute
  ),
)
```

### ☁️ Shadows / Elevations (`context.shadows`)
```dart
Container(
  decoration: BoxDecoration(
    boxShadow: context.shadows.elevation2, // For elevated cards
  ),
)
```

---

## 3. Recommended Component Usage

We have mapped the standard Flutter Material components directly into our `AppTheme`. This means **you should use the default Flutter widgets whenever possible without manually styling them.**

### Buttons
Simply use `ElevatedButton`, `OutlinedButton`, or `TextButton`.
- They automatically adopt the `brandPrimary` color, 56px heights, `cta` typography, and correct corner radiuses.
- **Example:**
  ```dart
  ElevatedButton(
    onPressed: () {},
    child: Text('Save Transaction'),
  )
  ```
- **Customizing State:** If you need a disabled state, either pass `null` to `onPressed` (Flutter handles disabled styling automatically), or use `ButtonStyle` with `WidgetStateProperty.resolveWith()` for custom interactive tweaks.

### Input Fields
Use `TextField` or `TextFormField`.
- They automatically implement the `bgSurface` fill color, 12px radiuses, and dynamic border coloration (grey borders that turn to `borderFocus` when focused).
- **Example:**
  ```dart
  TextFormField(
    decoration: InputDecoration(
      hintText: 'Enter amount...',
    ),
  )
  ```

### Cards
Use `Card()`.
- It defaults to the `bgSurface` background, zero elevation, and `borderRadius.card` corners.
- **Shadows with Cards:** Material default card shadows often look muddy. Our `CardTheme` strips the default shadow. If you need a drop-shadow on a card, wrap it or its contents in a `DecoratedBox`/`Container` and pass our custom shadows:
  ```dart
  Container(
    decoration: BoxDecoration(
      color: context.kitColors.bgSurface,
      borderRadius: context.borderRadius.card,
      boxShadow: context.shadows.elevation1,
    ),
    child: Padding(...),
  )
  ```

### Chips
Use `Chip()`, `ChoiceChip()`, or `InputChip()`.
- They natively map the padding, `textStyles.bodySM`, and standard grey borders.
- Active states in a `ChoiceChip` update automatically if wired up properly.

### Bottom Navigation Bar
Use `BottomNavigationBar()`.
- Active items grab the `brandPrimary` color, inactive ones grab `textPlaceholder`. Label typography scales to `tabLabel` automatically.

---

## 4. Best Practices for Developers

1. **Use Theme Extensions First**
   If a widget requests a decoration, padding, or text style, look inside `context.spacing`, `context.kitColors`, and `context.textStyles`.
2. **Handle Dark Mode Inherently**
   While the current phase is light-mode optimized, referring to `context.kitColors.bgSurface` rather than `Colors.white` will ensure your UI easily flips into Dark Mode when the dark token mapping is finalized.
3. **Interactive Widget States**
   When creating a highly custom widget that needs hover, pressed, or disabled states, utilize `WidgetStateProperty`:
   ```dart
   Color resolveBackgroundColor(Set<WidgetState> states) {
     if (states.contains(WidgetState.disabled)) {
       return context.kitColors.bgSurfaceSecondary;
     }
     if (states.contains(WidgetState.pressed)) {
       return context.kitColors.brandPrimaryDark;
     }
     return context.kitColors.brandPrimary;
   }
   ```
4. **Avoid `setState` where ValueNotifier suffices**
   (As per global user-rules), keep your UI clean and rebuilds optimized. Use `ValueNotifier` and `ListenableBuilder` rather than triggering monolithic widget rebuilds via `setState`.
