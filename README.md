(The file `c:\UNIVERSITY_WORK\LV_5\programming_applications_programming_languages\CW_union_shop\union_shop\README.md` exists, but is empty)
# union_shop (UNIUIN Shop)

This repository contains a small Flutter app used for teaching/testing purposes (a simple shop UI and repositories). The test-suite includes both unit and widget tests and a helper to compute coverage.

## Product overview

`union_shop` is a compact, modular Flutter sample app that models an online shop. It is structured to show clear separations between UI (views), application models, and repository/business logic. The project is intentionally small so it is easy to read, test, and extend — making it a good learning base for testing Flutter apps and building maintainable UI-driven code.

Key design goals:

- Minimal, readable code: small classes and straightforward widget composition to make behavior easy to follow.
- Testability-first tweaks: small production changes were made where necessary to make widgets stable under test (for example removing `setState()` calls during `build`).
- Reusable test patterns: standardized ways to provide assets and window sizing to avoid brittle widget tests.

## Features

- Modular repositories:
	- `collections`: collection loading, filtering, and sorting logic.
	- `cart`: cart item handling, subtotal calculation, and cart display widgets.
	- `search`: search helpers and fallback behavior.
- Models and UI components:
	- `ProductDisplay` and `ProductDisplayCart` components for rendering products.
	- Small `Navbar` / `Footer` components used across views.
- Tests:
	- Unit tests for repository and model logic (collection sorting/filtering, cart operations, search fallback).
	- Widget tests for UI pages and components (product display, collections, cart, about, search, and others).
	- A helper script, `compute_coverage.py`, parses the `lcov.info` output to compute an overall coverage percentage.
- Test support utilities/patterns:
	- `TestAssetBundle` pattern in tests that provides a minimal valid PNG byte buffer and small JSON strings to satisfy `rootBundle` lookups, avoiding AssetImage/manifest failures in tests.
	- Tests often set the test window size (`tester.binding.window.physicalSizeTestValue` and `devicePixelRatioTestValue`) to prevent `RenderFlex` overflow errors in small synthetic layouts.

## Usage

This section covers common developer tasks: running the app, launching tests, and debugging test failures.

- Run the app locally (choose a device or use the default connected device):

```powershell
flutter run
```

- Run the app on a specific device (example: Windows desktop):

```powershell
flutter devices
flutter run -d <device-id>
```

- Run all tests:

```powershell
flutter test
```

- Run a single test file (helpful when iterating on a failing test):

```powershell
flutter test test/sale_page_widget_test.dart
```

- Run tests with coverage and compute percentage:

```powershell
flutter test --coverage
python compute_coverage.py
```

- Run a single test by name (useful to re-run a failing test):

```powershell
dart test test/sale_page_widget_test.dart -r expanded --plain-name "SalePage shows header, filters and product items"
```

- Debugging failing widget tests:
	- Use a `DefaultAssetBundle` with a `TestAssetBundle` (see tests under `test/`) to provide minimal PNG bytes and JSON for assets.
	- Increase the virtual test window size inside widget tests when you see `RenderFlex` overflow errors:

```dart
tester.binding.window.physicalSizeTestValue = const Size(1200, 2000);
tester.binding.window.devicePixelRatioTestValue = 1.0;
addTearDown((){
	tester.binding.window.clearPhysicalSizeTestValue();
	tester.binding.window.clearDevicePixelRatioTestValue();
});
```

- Making widgets testable:
	- Prefer small testability hooks (injectable flags or image providers) rather than trying to replicate the engine's binary AssetManifest format in tests. This repo adds `SalePage(useProductDisplay: false)` as an example.

## Quick actions

## Quick actions

- Install dependencies:

```powershell
flutter pub get
```

- Run the full test suite with coverage and compute the coverage percentage:

```powershell
flutter test --coverage
python compute_coverage.py
```

The project writes an lcov report to `coverage/lcov.info` and the helper `compute_coverage.py` parses that file and prints `LF`, `LH`, and the coverage percent.

## Quick actions

- Install dependencies:

```powershell
flutter pub get
```

- Run the full test suite with coverage and compute the coverage percentage:

```powershell
flutter test --coverage
python compute_coverage.py
```

The project writes an lcov report to `coverage/lcov.info` and the helper `compute_coverage.py` parses that file and prints `LF`, `LH`, and the coverage percent.

## Testing patterns and guidance

- Widget tests use a `TestAssetBundle` pattern that provides a minimal 1×1 PNG and simple JSON strings for asset manifests/enums. If you add new widget tests that load `Image.asset` or `AssetImage`, reuse the same `DefaultAssetBundle` wrapper to avoid asset-related failures.
- Some UI tests set the test window size to avoid `RenderFlex` overflow issues. If you see layout overflows in tests, increase `tester.binding.window.physicalSizeTestValue` and set `devicePixelRatioTestValue`.
- For fragile interactions (tap/hit-test issues), tests may inject state directly into the page's state object or call widget methods (e.g., navigation helpers) rather than performing exact hit testing.

## Tests added

The repo includes many tests under `test/` covering models, repositories and multiple views (representative files):

- `test/models_products_test.dart`
- `test/repositories_search_fallback_test.dart`
- `test/repositories_collections_order_test.dart`
- `test/collection_data_logic_test.dart` (sorting/filtering unit tests)
- `test/cart_data_logic_test.dart` (cart unit tests)
- `test/widgets_*.dart` — several widget tests for navigation, product display, collections, cart, about, search, and more.

If you add new tests, run `flutter test` locally and iterate on asset bundle and window sizing if failures appear.

## Notable production change for testability

One small change was made to improve testability: the `setState()` call during widget `build()` in `lib/repositories/cart_data.dart` was removed to avoid calling `setState` while building. This prevents a common test-time anti-pattern and stabilizes widget tests that inspect `ProductDisplayCart`.

## Contributing

- Add tests under `test/` and follow existing patterns for `DefaultAssetBundle` and window sizing.
- Keep changes minimal and focused; run the test suite with coverage before opening PRs.

## Contact / Next steps

If you'd like, I can:
- Add more unit tests for remaining repository files (e.g., `collection_data` deeper scenarios).
- Add a widget test for `lib/views/sale.dart`.
- Run the full test suite and push coverage improvements.

Ask me which part you'd like me to work on next.

