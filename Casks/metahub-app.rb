cask "metahub-app" do
  version "0.2.0"

  on_arm do
    sha256 "1a2c7bfbba622185acb18763fd9f3bbe3e11b5f7a31ac233a7b276776b3583c9"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.2.0/Metahub-0.2.0-arm64.dmg"
  end
  on_intel do
    sha256 "f25bcbd5489ba2f3fc0a83871cbe6ea1fd1c3f820cf13b35b848511735693b2e"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.2.0/Metahub-0.2.0-x64.dmg"
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
