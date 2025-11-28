(The file `c:\UNIVERSITY_WORK\LV_5\programming_applications_programming_languages\CW_union_shop\union_shop\README.md` exists, but is empty)
# union_shop (UNIUIN Shop)

This repository contains a small Flutter app used for teaching/testing purposes (a simple shop UI and repositories). The test-suite includes both unit and widget tests and a helper to compute coverage.

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

