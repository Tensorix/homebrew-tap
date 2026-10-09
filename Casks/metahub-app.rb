cask "metahub-app" do
  version "0.3.1"

  on_arm do
    sha256 "745bf9bfbe67a85c747d9fa9d5c0262b10c8f52739e5914fc0ea84670eb2067d"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.3.1/Metahub-0.3.1-arm64.dmg"
  end
  on_intel do
    sha256 "70bcd4cacd04469a3dfa796ec998a9e1cd8c7ef295c0b70c2512c74c1844e0d0"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.3.1/Metahub-0.3.1-x64.dmg"
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
