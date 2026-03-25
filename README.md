# ofxTanim

`ofxTanim` is a WIP openFrameworks addon that integrates the [tanim](https://github.com/hegworks/tanim) timeline/editor workflow with OF projects.  
The project is still in its early stages. It was developed using `OpenAI Codex` with the `Codex GPT 5.3` model.  
My idea was to pass `ofParameters` to a manager class that would internally handle the rendering of `ImGui` and the Talim classes.  

It is designed for projects that want:
- timeline-based animation tracks,
- runtime playback,
- editor controls through ImGui,
- reflection-based binding of component fields.

## Requirements

- openFrameworks `0.12.1`.
- Tested in Windows 11 / Visual Studio 2026.
- `ofxImGui`
- `ofxEnTT`

Some examples may use additional addons (for example `ofxSurfingImGui`).

## Repository Layout

- `src/` -> addon integration sources.
- `libs/include/tanim/` -> core `tanim` headers.
- `libs/external/` -> bundled third-party headers used by `tanim`.
- `docs/` -> integration docs and type support references.
- `example-basic/` -> reference demo for timeline + parameter bridge.
- `example-minimal/` -> minimal cube demo using `glm::vec3` position/rotation and callbacks.

## Quick Start

1. Add `ofxTanim` to your OF project.
2. Ensure `ofxImGui` and `ofxEnTT` are also added.
3. Register your animatable component fields with Tanim reflection macros.
4. Create/open timeline data and drive playback in `update()`.

For a working baseline, start from:
- `addons/ofxTanim/example-basic`
- `addons/ofxTanim/example-minimal`

## Example Notes

### `example-basic`
- Demonstrates timeline setup and parameter synchronization patterns.
- Includes a richer manager flow for bool/float/int/bang style controls.

### `example-minimal`
- Focused demo with a simple cube scene.
- Animates `glm::vec3` position and `glm::vec3` rotation.
- Uses `SurfingTimelineManager` to auto-register supported `ofParameter` values.
- Emits callbacks for bool toggles and bang triggers.

## Build

Use the standard openFrameworks workflow:

- Generate/build with Project Generator and your IDE, or
- Build using the provided OF make/msbuild flow inside each example folder.

`example-minimal` includes `build-msbuild.ps1` to locate `MSBuild.exe` automatically on Windows.

## Documentation

Detailed references are available in:
- `docs/README.md`
- `docs/integration-reference.md`
- `docs/supported-types.md`
- `docs/ui-shortcuts.md`

## Notes

- The addon relies on OF's `glm`/JSON environment and avoids local duplicate includes to reduce version conflicts.
- If you update external dependencies, keep the OF toolchain and addon dependencies in sync.
