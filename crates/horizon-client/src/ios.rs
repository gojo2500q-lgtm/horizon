//! iOS host entry point.
//!
//! The UIKit host sets HORIZON_HOME and HORIZON_GAME_DIR to directories inside the
//! app container before calling this function. Keeping the entry point in Rust lets
//! the iOS shell remain a thin presentation layer.

/// Start Horizon from the iOS host.
///
/// The host must set `HORIZON_HOME`, `HORIZON_GAME_DIR`, and, once prepared assets
/// are imported, `HORIZON_RESOURCES` before calling this function.
#[unsafe(no_mangle)]
pub extern "C" fn horizon_ios_start() {
    if let Some(game_dir) = std::env::var_os("HORIZON_GAME_DIR") {
        let _ = std::env::set_current_dir(game_dir);
    }
    crate::entry::main();
}
