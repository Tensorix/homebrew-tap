cask "metahub-app" do
  version "0.3.0"

  on_arm do
    sha256 "cfb710c1ae8a159e44ce32c1e8ac71a117d32980672493f35db3b9b6a36d4a39"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.3.0/Metahub-0.3.0-arm64.dmg"
  end
  on_intel do
    sha256 "a32b533fecbd0de4f01d761b5e331dafe3c9c086cf54e130663cf4f9c55a1cd1"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.3.0/Metahub-0.3.0-x64.dmg"
  end

  name "Metahub"
  desc "Local-first typed knowledge base with CRDT sync for AI agents (desktop app)"
  homepage "https://github.com/Tensorix/metahub-core"

  # The bundle inside the dmg is "metahub-desktop.app": electron-builder 26 names
  # the .app after executableName (set in electron-builder.yml to dodge the '@' in
  # the scoped npm name), not productName. Copy that real name but install it as
  # "Metahub.app" so the user-facing app — and the postflight/zap paths below —
  # stay "Metahub.app".
  app "metahub-desktop.app", target: "Metahub.app"

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
