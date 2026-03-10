---
name: flutter-ui-replicator
description: >
  Pixel-perfect replication of UI screenshots (and optional companion HTML files) into
  production-quality Flutter code. Use this skill whenever the user shares a screenshot,
  mockup, Figma export, or HTML file and wants it converted to Flutter — even if they
  phrase it as "port this", "build this in Flutter", "make this screen", "convert to
  Flutter", or "replicate this UI". Always use this skill when both a visual reference
  and Flutter output are involved. The skill enforces strict architectural rules:
  class-based widgets only (no buildWidgetX functional patterns), reusable small
  composable widgets, data-ready models, and exact visual fidelity.
---

# Flutter UI Replicator

Convert screenshots and/or HTML mockups into pixel-perfect, production-ready Flutter
code with strict architectural standards.

---

## 0. Pre-flight — Gather Assets

Before writing a single line of Flutter, collect and understand all available inputs.

| Input | How to use it |
|---|---|
| **Screenshot(s)** | Ground truth for visual fidelity. Treat every pixel as a spec. |
| **Companion HTML file** | Mine for exact colors (hex/rgba), font sizes (px → sp), spacing (px → logical px), border radii, shadow values, z-ordering, and semantic structure. |
| **Both provided** | HTML is the source of truth for values; screenshot is the source of truth for layout feel and any undocumented visual effects. |

**When only a screenshot is provided**, infer values systematically:
- Use relative proportions and visual estimation.
- Prefer standard Material / Cupertino tokens where ambiguous (e.g. 4/8/12/16/24 dp grid).
- Document every inferred value with a comment so the developer can tune it.

---

## 1. Visual Deconstruction Protocol

Before generating code, perform a silent mental (or explicit) breakdown:

```
1. LAYOUT SKELETON
   - Identify the outermost container type (Scaffold, Stack, Column, Row, CustomScrollView…)
   - Map the layout into a tree: note axis, alignment, spacing, flex ratios

2. VISUAL ZONES
   - Header / AppBar
   - Body sections (cards, lists, grids, hero areas)
   - Sticky / floating elements (FABs, bottom bars, overlays)
   - Footer

3. ATOMS (smallest reusable units)
   - Buttons, chips, badges, avatars, icons, tags, dividers
   - Typography styles (map each unique text style to a named TextStyle)

4. MOLECULES (composed atoms)
   - List tiles, card bodies, form rows, stat blocks

5. ORGANISMS (composed molecules)
   - Full cards, modals, section groups

6. COLOR PALETTE
   - Extract every unique color → name it semantically (primaryBlue, surfaceCard, textMuted…)
   - Define all in a single AppColors class

7. TYPOGRAPHY SYSTEM
   - Extract every unique text style → define in AppTextStyles class

8. SPACING / SIZING TOKENS
   - Identify recurring spacing values → define in AppSpacing / AppSizes classes
```

Only after this breakdown, begin writing widgets.

---

## 2. Architecture Rules (NON-NEGOTIABLE)

### 2.1 Class Widgets Only

Every UI fragment MUST be a `StatelessWidget` or `StatefulWidget` class.

```dart
// ✅ CORRECT
class UserAvatarBadge extends StatelessWidget {
  const UserAvatarBadge({super.key, required this.user, this.size = 40});

  final UserModel user;
  final double size;

  @override
  Widget build(BuildContext context) { … }
}

// ❌ FORBIDDEN — functional builder pattern
Widget _buildUserAvatar(UserModel user) { … }
Widget buildAvatarWidget() { … }
```

### 2.2 Single-Responsibility Widgets

Each widget class does ONE visual job. A widget that renders a card header is not also
responsible for the card body. Target: if the `build` method exceeds ~40 lines, split it.

### 2.3 Data-Ready Design

Every widget that displays data must accept it via typed constructor parameters backed
by a model class. No hardcoded strings/numbers inside widget classes (except layout
constants). All sample/placeholder data lives in a dedicated `*MockData` class.

```dart
// Widget signature must reflect the real data shape
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onTap});
  final ProductModel product;
  final VoidCallback? onTap;
  …
}
```

### 2.4 Named Constructors for Variants

Prefer named constructors or factory constructors over boolean flags for visual variants:

```dart
class StatusBadge extends StatelessWidget {
  const StatusBadge.success({super.key, required this.label});
  const StatusBadge.warning({super.key, required this.label});
  const StatusBadge.error({super.key, required this.label});
  …
}
```

### 2.5 Const-First

Mark every constructor `const`. Pass `const` where possible in widget trees.

---

## 3. File & Folder Structure

Emit code organized according to the project's architecture rules (`agents.md`). When generating UI code, adhere to this general structure:

```text
lib/
├── core/
│   └── ui/
│       ├── constants/               ← CHECK HERE FIRST for existing design tokens!
│       │   ├── kit_colors.dart      ← existing Color constants
│       │   ├── text_styles.dart ← existing TextStyle constants
│       │   └── spacing.dart     ← existing spacing / sizing tokens
│       │
│       └── [common widgets]/        ← generic, app-wide reusable components (if creating global UI)
│
├── feature_name/                    ← feature-specific code (adjust depth to complexity)
│   ├── models/                      ← feature-specific data models
│   ├── views/                       ← feature UI components
│   │   ├── widgets/                 ← atoms, molecules, organisms for this feature
│   │   │   ├── status_badge.dart
│   │   │   ├── user_list_tile.dart
│   │   │   └── dashboard_header.dart
│   │   └── dashboard_view.dart      ← full screen / page (named *_view.dart)
│   └── mock_data/                   ← sample data for development (if needed temporarily)
```

### Theming Strategy (CRITICAL)

1. **Analyze Existing Theming First:** Before creating new colors, text styles, or spacing constants, **ALWAYS** check the existing files in `lib/core/ui/constants/`.
2. **Exact Match:** If the required token exactly matches (or is semantically identical to) an existing one in the project's theme, **reuse the existing token**.
3. **Custom Mapping (Fallback):** Only if there is no exact or contextually appropriate match in the existing theme should you create a custom mapping or propose adding the new token to the respective constants file.

When outputting to a single file (for quick review), use clear region comments:
`// ═══ THEME (Existing/Custom) ═══`, `// ═══ WIDGETS (Atoms/Molecules/Organisms) ═══`, `// ═══ VIEW ═══`, etc.

---

## 4. Pixel-Perfect Techniques

### 4.1 Colors

```dart
// From HTML: background: #1A2332  → 
static const Color surfaceDark = Color(0xFF1A2332);

// From HTML: rgba(255,255,255,0.08) →
static const Color overlaySubtle = Color(0x14FFFFFF);
```

### 4.2 Typography (px → Flutter sp)

Flutter `sp` ≈ CSS `px` at 1:1 on a 1× device. Use the CSS px value directly as sp.
For `rem`-based values, assume 1rem = 16px.

```dart
static const TextStyle headingLg = TextStyle(
  fontFamily: 'Inter',           // match the HTML font-family
  fontSize: 24,                  // from CSS font-size: 24px
  fontWeight: FontWeight.w700,   // from CSS font-weight: 700
  height: 1.3,                   // from CSS line-height: 31px → 31/24 ≈ 1.3
  letterSpacing: -0.5,           // from CSS letter-spacing: -0.5px
  color: AppColors.textPrimary,
);
```

### 4.3 Spacing (CSS px → Flutter logical px)

Direct 1:1 mapping. CSS `padding: 16px 24px` → `EdgeInsets.symmetric(vertical: 16, horizontal: 24)`.

### 4.4 Border Radius

CSS `border-radius: 12px` → `BorderRadius.circular(12)`.
CSS `border-radius: 8px 8px 0 0` → `BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))`.

### 4.5 Shadows

CSS `box-shadow: 0 4px 16px rgba(0,0,0,0.12)` →
```dart
BoxShadow(
  color: Color(0x1F000000),  // 0.12 × 255 ≈ 31 = 0x1F
  blurRadius: 16,
  offset: Offset(0, 4),
)
```

### 4.6 Gradients

CSS `linear-gradient(135deg, #6366F1 0%, #8B5CF6 100%)` →
```dart
LinearGradient(
  begin: Alignment.topLeft,     // 135deg
  end: Alignment.bottomRight,
  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
)
```

### 4.7 Opacity / Blur (Glass Effects)

CSS `backdrop-filter: blur(20px)` + semi-transparent background →
```dart
ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.glassBackground, // e.g. Color(0x1AFFFFFF)
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0x33FFFFFF)),
      ),
      child: …,
    ),
  ),
)
```

### 4.8 Responsive Adaptations

When the screenshot implies a mobile layout, wrap adaptations in:
```dart
LayoutBuilder(builder: (context, constraints) {
  final isWide = constraints.maxWidth > 600;
  …
})
```
Do not hardcode device widths unless the design is explicitly fixed-width.

---

## 5. Model Design

Models must be immutable, `const`-constructable, and `copyWith`-enabled.

```dart
class ProductModel {
  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
    this.badge,
    this.isAvailable = true,
  });

  final String id;
  final String name;
  final double price;
  final String? imageUrl;
  final String? badge;
  final bool isAvailable;

  ProductModel copyWith({…}) { … }
}
```

Fields must directly match what the widget tree consumes — no raw Maps or dynamic types.

---

## 6. Mock Data Conventions

```dart
// dashboard_mock_data.dart
abstract final class DashboardMockData {
  static const List<StatCardModel> statCards = [
    StatCardModel(label: 'Total Revenue', value: '\$48,295', delta: '+12.4%', trend: Trend.up),
    StatCardModel(label: 'Active Users',  value: '3,842',   delta: '+5.1%',  trend: Trend.up),
    StatCardModel(label: 'Bounce Rate',   value: '24.6%',   delta: '-2.3%',  trend: Trend.down),
  ];
}
```

---

## 7. Output Checklist

Before finalising output, verify each item:

- [ ] Every widget is a class (`StatelessWidget` / `StatefulWidget`)
- [ ] No `buildWidgetX()` / `_buildX()` functional patterns anywhere
- [ ] All colors defined in `AppColors` — no inline `Color(0xFF…)` in widget trees
- [ ] All text styles defined in `AppTextStyles` — no inline `TextStyle(…)` in widget trees
- [ ] All spacing uses `AppSpacing` constants or named `EdgeInsets` — no magic numbers
- [ ] Every data-displaying widget accepts a typed model via constructor
- [ ] Mock data lives in a `*MockData` class, not inside widget files
- [ ] All constructors are `const`
- [ ] Shadows, gradients, border radii match the source exactly
- [ ] Font family, weight, size, line-height, letter-spacing all extracted and applied
- [ ] Screen composes organism widgets; organisms compose molecules; molecules compose atoms
- [ ] No widget's `build` method exceeds ~40 lines (split if needed)
- [ ] Inferred values are annotated with `// inferred` comment

---

## 8. Annotated Output Example

When delivering output, structure it as:

```
1. [ANALYSIS SUMMARY]
   Brief description of what was found in the screenshot/HTML:
   layout structure, color palette, font stack, key components identified.

2. [THEME FILES]
   AppColors, AppTextStyles, AppSpacing

3. [MODELS]
   All data model classes

4. [MOCK DATA]
   Sample data class(es)

5. [ATOMS]
   Smallest widget classes, in dependency order

6. [MOLECULES]
   Composed widgets

7. [ORGANISMS]
   Section-level widgets

8. [SCREEN]
   The top-level screen widget that assembles everything

9. [NOTES / INFERRED VALUES]
   Bullet list of any values that were estimated and may need tuning
```

---

## 9. Common Pitfalls to Avoid

| Pitfall | Correct Approach |
|---|---|
| Using `Text('John Doe')` inside a widget class | Accept `final String name` in constructor |
| `Color(0xFF…)` inline in widget tree | Always reference `AppColors.xxx` |
| Nesting 6 levels deep in one widget class | Extract inner subtrees to named widget classes |
| `Column` with hardcoded `SizedBox(height: 999)` | Use `AppSpacing.xl` token |
| `buildHeader()` method inside a widget class | Create `class ScreenHeader extends StatelessWidget` |
| Ignoring the `const` keyword | Always add `const` to constructors and usage |
| Using `dynamic` in models | Type every field explicitly |
| Forgetting `key` parameter | Always include `{super.key}` |
| Single monolithic screen file | One file per atom/molecule/organism |
| Skipping shadows or gradients because they're "close enough" | Extract and match exactly from HTML/screenshot |

---

## 10. HTML Companion Parsing Tips

When an HTML file is provided, mine these specifically:

```
CSS property            →  Flutter equivalent
─────────────────────────────────────────────────────
font-family             →  fontFamily in TextStyle
font-size: Xpx          →  fontSize: X
font-weight: 600        →  FontWeight.w600
line-height: X          →  height: X / fontSize
letter-spacing: Xpx     →  letterSpacing: X
color: #RRGGBB          →  Color(0xFFRRGGBB)
background-color        →  color in BoxDecoration / Container
padding / margin        →  EdgeInsets
border-radius: Xpx      →  BorderRadius.circular(X)
box-shadow              →  BoxShadow(…)
display: flex           →  Row / Column
flex-direction: column  →  Column
justify-content: center →  mainAxisAlignment: MainAxisAlignment.center
align-items: center     →  crossAxisAlignment: CrossAxisAlignment.center
gap: Xpx                →  SizedBox(width/height: X) or spacing in Row/Column
position: absolute      →  Stack + Positioned
overflow: hidden        →  ClipRRect / ClipRect
opacity: 0.5            →  Opacity(opacity: 0.5) or color with alpha
```

Parse the HTML element hierarchy to understand the widget tree topology before coding.
