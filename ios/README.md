# Horizon iOS port

This directory contains the first iOS host layer for Horizon. The app keeps its data inside the iOS sandbox:

- `Library/Application Support/Horizon`: logs, settings, caches, and app-managed state.
- `Documents/Horizon`: game data that should be user-exportable, including worlds and imported resources.

The Rust client exports `horizon_ios_start()` from the `horizon-client` static library. The UIKit shell sets the storage environment and invokes that entry point.

## Build with GitHub Actions

Run the **iOS IPA** workflow manually from the Actions tab. It uses a macOS runner to install the iOS Rust target, build `libhorizon_client.a`, compile the Xcode host, and upload `HorizonIOS-unsigned.ipa` as an artifact.

Download the artifact, then install it with SideStore. SideStore can apply your device signing. The repository does not contain Apple certificates or provisioning profiles.

## Current boundary

This is the buildable host layer, not a finished mobile experience yet. The next port steps are to make the winit/Metal surface attach to the UIKit view, add touch controls, import prepared resources through Files/iTunes sharing, and remove desktop-only launcher and Java-runtime assumptions from the mobile flow. JIT is not used.
