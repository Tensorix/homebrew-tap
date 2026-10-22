cask "metahub-app" do
  version "0.3.2"

  on_arm do
    sha256 "48ae23672ad434002e98cac08f0000fd637c5d45e2d8d8cd59a49dba7e099f82"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.3.2/Metahub-0.3.2-arm64.dmg"
  end
  on_intel do
    sha256 "bf89292c8c571f9391e6e599f59e441ffe5b0a73670f04b1cb9020f981457da9"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.3.2/Metahub-0.3.2-x64.dmg"
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
