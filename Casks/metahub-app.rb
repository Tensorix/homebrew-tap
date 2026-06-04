cask "metahub-app" do
  version "0.1.0"

  on_arm do
    sha256 "c57f3211bee6d6cdd3e6388e42f91807fba756c3f588577d03c3c5e307ba9c09"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.0/Metahub-0.1.0-arm64.dmg"
  end
  on_intel do
    sha256 "5272740177e081590c47154342cc4bbcc28691c1f0ff12464acde129e35d40a8"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.0/Metahub-0.1.0.dmg"
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
