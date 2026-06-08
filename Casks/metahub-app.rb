cask "metahub-app" do
  version "0.1.1"

  on_arm do
    sha256 "bbf20975535a4a9ee403cd2ae50186108812c3c55b64575ff43531aa8ab09de0"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.1/Metahub-0.1.0-arm64.dmg"
  end
  on_intel do
    sha256 "0c440024f91f2c7f835831fc7892e9c1c670054e2e0027277ff9069f04ae0f22"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.1/Metahub-0.1.0-x64.dmg"
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
