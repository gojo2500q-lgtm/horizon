import UIKit

final class HorizonViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureHorizonStorage()

        // The first Rust entry point owns the game loop. It must be called on the
        // main thread because the eventual winit/Metal surface is main-thread bound.
        horizon_ios_start()
    }

    private func configureHorizonStorage() {
        let fm = FileManager.default
        let appSupport = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let documents = fm.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let home = appSupport.appendingPathComponent("Horizon", isDirectory: true)
        let game = documents.appendingPathComponent("Horizon", isDirectory: true)
        try? fm.createDirectory(at: home, withIntermediateDirectories: true)
        try? fm.createDirectory(at: game, withIntermediateDirectories: true)

        setenv("HORIZON_HOME", home.path, 1)
        setenv("HORIZON_GAME_DIR", game.path, 1)
    }
}
