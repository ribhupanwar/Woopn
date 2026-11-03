# WHOOP 5.75.0 visual-parity reference

## Source and provenance

- Reference: `ribhupanwar/dsta` release asset `whoop-5.75.0/pulseforge.ipa`
- App bundle: `com.whoop.iphone`
- Version/build: `5.75.0 (738478)`
- SHA-256 verified by the extraction workflow: `8a5deedc59567612683feb77dd7348238de89437123946b3344bc6ff1e90af8a`
- Static extraction workflow: `ribhupanwar/dsta`, `.github/workflows/inspect-whoop-ipa-ui.yml`
- Artifact: `whoop-5.75.0-ipa-ui-reference`, run `41341431589`

The extraction inventories the app bundle, localized strings, NIB/storyboard metadata, asset-catalog metadata and executable symbols. It does **not** recover the original SwiftUI source or produce runtime screenshots. The reference is therefore strong for names, navigation concepts, available assets and measured colour tokens, but is not by itself a pixel-perfect screenshot specification.

## Verified navigation and screen structure

- Main-tab localization includes Home, Coaching, Community, Health and More (and additional conditional tabs: Plan, Profile and Shop).
- Home onboarding explicitly describes daily metrics, activities and weekly trends, with swipe navigation to Sleep, Recovery and Strain pillars.
- The Home overview widget is labelled Daily Summary and describes Sleep Performance, Recovery and current-day Strain.
- The overview gauge exposes PERFORMANCE, RECOVERY, SLEEP and STRAIN labels, plus HRV.
- Recovery, Sleep Performance and Strain have separate overview-circle widgets.
- Activity details expose Heart Rate, Map, User Input and statistics for Avg HR, Max HR, Min HR, RHR, HRV, calories, distance, duration, pace and strain.
- Health metric vocabulary includes HRV, RHR, respiratory rate, blood oxygen and skin temperature.

## Measured asset-catalog colour tokens

Values are read from the WHOOP app's `Assets.car` metadata (sRGB):

| Token | Value |
|---|---|
| Grey Blue | `#1A2227` |
| Day Strain | `#0093E7` |
| Sleep | `#7BA1BB` |
| Recovery High | `#19EC06` |
| Recovery Medium | `#FFDE00` |
| Recovery Low | `#FF0026` |
| Black 15 / 20 / 30 / 40 | black at 15 / 20 / 30 / 40% opacity |
| White 20 / 50 | white at 20 / 50% opacity |

These measured tokens are implemented as clean-room SwiftUI values in `Packages/StrandDesign/Sources/StrandDesign/WhoopReferencePalette.swift`.

## Implementation constraints

- Preserve Woop's existing Strand font files, BLE pipeline, repositories, analytics, persistence and navigation data flow.
- Do not copy compiled WHOOP code, proprietary image assets or embedded font files into Woop. Use clean-room SwiftUI equivalents.
- Keep unavailable measurements blank; never insert sample HRV, RHR, Recovery, Sleep or Strain values to make a screen look populated.
- Port the Home, Recovery, Sleep, Strain and Activity experiences first; then reconcile the top-level tab shell and secondary surfaces.
- Each screen requires device/simulator screenshots at the same device size and content state as the reference before pixel-level spacing, typography and chart geometry can be signed off.

## Current status

- [x] Pinned IPA provenance and SHA-256 verified.
- [x] Extracted UI resource inventory, localization strings, NIB metadata and asset-catalog metadata.
- [x] Added measured colour tokens to StrandDesign.
- [ ] Build the five primary screen compositions in the Woop app architecture.
- [ ] Align tab navigation and gestures with the reference.
- [ ] Build on the iOS Simulator.
- [ ] Compare same-size runtime screenshots and iterate until visual differences are minimized.
