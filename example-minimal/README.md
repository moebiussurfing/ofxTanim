# example-minimal

Minimal openFrameworks example for **ofxTanim** showing:
- Timeline-driven animation of `glm::vec3` **Position** and `glm::vec3` **Rotation**.
- A simple 3D cube scene.
- `SurfingTimelineManager`, which auto-bridges `ofParameter` values with Tanim tracks.
- Callback routing for bool toggles and bang buttons.

## What this example demonstrates

`SurfingTimelineManager` automates most internal timeline plumbing:
- You only add parameters to an `ofParameterGroup`.
- The manager scans the group recursively and auto-registers supported types.
- It creates and configures timeline tracks/keyframes.
- It keeps timeline values and UI parameters synchronized.
- It emits callbacks for bool toggles and bangs.

## Supported auto-detected parameter types

- `ofParameter<glm::vec3>`
  - Mapped to timeline fields `position` and `rotation`.
- `ofParameter<bool>`
  - Mapped to timeline field `toggle`.
- `ofParameter<void>`
  - Mapped to timeline field `bangPulse`.

## Naming heuristics

The manager uses parameter names to map fields:
- Names containing `pos`, `position`, `translate` -> `position`
- Names containing `rot`, `rotation`, `euler` -> `rotation`
- Names containing `toggle`, `visible`, `enable`, `show` -> `toggle`
- Names containing `bang`, `trigger`, `pulse` -> `bangPulse`

If no keyword matches, it assigns the first available compatible field.

## Quick usage pattern

In `ofApp::setup()`:

1. Add your parameters to `ofParameterGroup`.
2. Call `timelineManager_.addParameters(parameters_)`.
3. Register optional callbacks:
   - `setBoolToggleCallback(...)`
   - `setBangCallback(...)`
4. Call `timelineManager_.setup(...)`.

In `update()` and `draw()`:

- `timelineManager_.update(ofGetLastFrameTime())`
- `timelineManager_.drawControlsAndTimeline()`

## Build on Windows with MSBuild

This folder includes `build-msbuild.ps1` to locate `MSBuild.exe` automatically.

Examples:

```powershell
# Release build
.\build-msbuild.ps1

# Debug rebuild
.\build-msbuild.ps1 -Target Rebuild -Configuration Debug

# Clean release
.\build-msbuild.ps1 -Target Clean -Configuration Release
```

Optional: set a custom path explicitly:

```powershell
$env:MSBUILD_EXE = 'C:\Path\To\MSBuild.exe'
.\build-msbuild.ps1
```

## Build with make (MSYS2)

```bash
make -j
```

## Runtime notes

- Open the timeline window from the ImGui controls panel.
- In play mode, timeline animation drives the cube transform.
- Bool and bang callbacks are shown in the "Callbacks" window and logged to the console.
