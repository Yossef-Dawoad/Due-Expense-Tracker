# AGENTS.md
Operating guide for agentic coding tools in `Due-Expense-Tracker`.

## Project Overview
- App: Flutter expense tracker (`expancetracker`)
- Dart SDK: `>=3.10.1 <4.0.0`
- Flutter SDK: `3.41.3`
- Architecture: MVVM + Service Locator + offline-first repositories
- Local DB: Drift (`AppDatabase`)
- Remote backend: PocketBase
- Navigation: `go_router` via `RouterService`
- State: `ValueNotifier` + `ValueListenableBuilder`
- Codegen: `build_runner`, `drift_dev`, `dart_mappable`, `envied`

## Rule Sources Checked
- `.cursor/rules/`: not found
- `.cursorrules`: not found
- `.github/copilot-instructions.md`: not found
- Existing root `AGENTS.md`: not found before creating this file

If Cursor/Copilot rule files are added later, treat them as higher-priority and
merge their guidance into this document.

## Core Commands
- Run from repo root: `C:\Users\joedev\dev\Due-Expense-Tracker`
- Install dependencies: `flutter pub get`
- Generate code (Drift/mappable/env changes): `dart run build_runner build --delete-conflicting-outputs`
- Clean + regenerate codegen: `dart run build_runner clean` then `dart run build_runner build --delete-conflicting-outputs`
- Format: `dart format .`
- Analyze/lint: `flutter analyze`
- Run all tests: `flutter test`
- Run one test file: `flutter test test/wallet/wallet_repository_test.dart`
- Run one test by name: `flutter test test/wallet/wallet_repository_test.dart --plain-name "should return accounts from local source"`
- Build APK (CI-aligned): `flutter clean` then `flutter build apk --release --no-tree-shake-icons`
- `--plain-name` supports substring matching; use a unique phrase.

## CI Reference
Workflow: `.github/workflows/android_build.yml`

Pipeline currently runs:
1. `dart run build_runner clean`
2. `dart run build_runner build --delete-conflicting-outputs`
3. `flutter clean`
4. `flutter build apk --release --no-tree-shake-icons`

Recommended pre-PR checks:
1. `dart run build_runner build --delete-conflicting-outputs` (if relevant)
2. `dart format .`
3. `flutter analyze`
4. `flutter test`

## Practical Execution Order
Use this order unless a task explicitly asks otherwise:
1. Read nearby files to match existing patterns.
2. Implement minimal, scoped code changes.
3. Run targeted test file(s) first.
4. Run `flutter analyze` for touched areas/full project.
5. Run `flutter test` for broad confidence.
6. If schema/annotations changed, run codegen before analyze/tests.

Fast path examples:
- ViewModel/UI-only tweak: `dart format .` -> single test file -> `flutter analyze`
- Repository/data-source change: codegen if needed -> focused tests -> `flutter test`
- Route changes: run navigation-related tests + smoke test app startup

Definition of done for agent changes:
- Code compiles and follows lint/type rules.
- New behavior covered by at least one relevant test when feasible.
- No manual edits to generated files.
- Commands used are documented in task notes when non-obvious.

## Architecture And Layering Rules
- Follow MVVM.
- Views: UI + `BuildContext`-dependent behavior only.
- ViewModels: presentation logic/state; do not depend on `BuildContext`.
- Services: shared cross-screen state and coordination.
- Keep screen-local state in the owning ViewModel.
- Avoid ViewModel-to-ViewModel dependencies.
- Prefer constructor injection with explicit `required` params.
- Register app-wide modules in `lib/config/locator_config.dart`.
- Dispose owned notifiers/controllers/subscriptions in the owning layer.

## State Management Conventions
- Use `ValueNotifier<T>` for single value state.
- For related fields, use one state model + one notifier when practical.
- Update collection values immutably (`value = [...value, item]`).
- Bind UI with `ValueListenableBuilder`.
- Expose notifier-backed read access via getters where it improves ergonomics.

## Navigation Conventions
- Keep route constants in `lib/core/utils/navigation/routes.dart`.
- Do not hardcode route literals in feature code.
- Use `RouterService.go(...)` for primary navigation.
- Use `push(...)` for temporary/modal flows.
- Unknown routes should end at `Routes.notFound`.

## Import And File Organization
- Prefer package imports for app code:
  - `import 'package:expancetracker/...';`
- Relative imports exist; avoid adding new deep relative imports when package
  imports are clear.
- Keep import groups stable:
  1. Dart SDK
  2. Flutter/package
  3. App imports
- Avoid analyzer violations like `implementation_imports`.
- Keep files within feature folders (`home/`, `transactions/`, `wallet/`, etc.).

## Types, Naming, And API Shape
- Classes/enums/typedefs: PascalCase.
- Variables/methods/params: camelCase.
- File names: `snake_case.dart`.
- Route constants currently use `lowerCamelCase` static const names.
- Prefer explicit types when inference is not obvious.
- Do not introduce implicit `dynamic` or implicit casts.

## Formatting And Lint Expectations
- Use `dart format .` for all touched files.
- Project includes `package:flutter_lints/flutter.yaml`.
- Strong mode is strict (`implicit-casts: false`, `implicit-dynamic: false`).
- Keep code warning-free under `flutter analyze` where possible.

## Error Handling And Logging
- Add `try/catch` at I/O boundaries (datasources/repositories/services).
- In offline-first sync loops, log per-item failures and continue when safe.
- Propagate critical sync failures to orchestration/retry layers.
- Avoid silent failure unless intentionally delegated and documented.
- Surface user-facing errors via `NotifyService`/toast events.

## Generated Files Policy
- Do not hand-edit generated files:
  - `*.g.dart`
  - `*.mapper.dart`
- Regenerate after changing source annotations/schema.
- Keep generated artifacts in sync before commit.

## Testing Guidance
- Mirror feature structure from `lib/` into `test/`.
- Use Arrange-Act-Assert style.
- Use `mocktail` for boundary mocking.
- Keep unit tests deterministic (no real network/filesystem).
- For Drift tests, prefer in-memory DB (`NativeDatabase.memory()`).

## Agent Workflow Tips
- Read nearby files first to match local conventions.
- Keep diffs focused; avoid unrelated refactors.
- Run targeted tests first, then broader checks.
- If codegen is affected, run generation before analyze/test.
- Package name typo `expancetracker` is intentional; do not “fix” globally.
