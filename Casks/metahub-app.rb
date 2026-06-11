cask "metahub-app" do
  version "0.1.4"

  on_arm do
    sha256 "40d1b5246421e5c39a25c71c1b27a73a6d4e0dbfd772bcec0f0a55be952b9567"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.4/Metahub-0.1.4-arm64.dmg"
  end
  on_intel do
    sha256 "44716daac21035e504fb461b808e442258f157c1aa166f8dfb51f0e71c7d3ebb"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.4/Metahub-0.1.4-x64.dmg"
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
