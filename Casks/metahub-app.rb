cask "metahub-app" do
  version "0.1.1"

  on_arm do
    sha256 "42d997f4665f47c1502067c7fbb864437d307099672f329c7233e3ddd35e0112"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.1/Metahub-0.1.1-arm64.dmg"
  end
  on_intel do
    sha256 "449d4822c54113b9c1c8e697db38ca83bf06877d2e51b492c5e66cb48a7f8b18"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.1/Metahub-0.1.1-x64.dmg"
  end

  name "Metahub"
  desc "Local-first typed knowledge base with CRDT sync for AI agents (desktop app)"
  homepage "https://github.com/Tensorix/metahub-core"

  app "Metahub.app"

  # Unsigned, by design (open-source — no Apple Developer signing). macOS would
  # otherwise flag the freshly installed .app as "damaged" (the quarantine
  # attribute on an unsigned, un-notarized bundle). Strip it on install so the
  # app opens on first launch without a Gatekeeper detour.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Metahub.app"]
  end

  zap trash: [
    "~/Library/Application Support/Metahub",
    "~/Library/Preferences/org.tensorix.metahub.plist",
    "~/Library/Saved Application State/org.tensorix.metahub.savedState",
  ]
end
