cask "metahub-app" do
  version "0.1.1"

  on_arm do
    sha256 "b71cf344b67c54d7a049b8ceee9dc7126cd92c1340a30d8451d6e4ec7aa1b2dc"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.1/Metahub-0.1.0-arm64.dmg"
  end
  on_intel do
    sha256 "811dd6429c6019f5d4de501680bcff33390708f7af3cf1e9d1fc02b62e5d7618"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.1/Metahub-0.1.0-x64.dmg"
  end

  name "Metahub"
  desc "Local-first typed knowledge base with CRDT sync for AI agents (desktop app)"
  homepage "https://github.com/Tensorix/metahub-core"

  app "Metahub.app"

  # Unsigned, by design (open-source — no Apple Developer signing). Installed via
  # Homebrew the binary is not quarantined the way a browser download is; if you
  # still hit Gatekeeper, install with `--no-quarantine` or allow it once in
  # System Settings → Privacy & Security.

  zap trash: [
    "~/Library/Application Support/Metahub",
    "~/Library/Preferences/org.tensorix.metahub.plist",
    "~/Library/Saved Application State/org.tensorix.metahub.savedState",
  ]
end
