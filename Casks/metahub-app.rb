cask "metahub-app" do
  version "0.4.2"

  on_arm do
    sha256 "42a0bfb28313d5f3475c8c2723702193c3244b06e28f88a3cd03b1b17a18dfc0"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.4.2/Metahub-0.4.2-arm64.dmg"
  end
  on_intel do
    sha256 "f8aac390ed3bc28f7366e8b521c5458bb7eae2ddc216527c4368d6219f06eb31"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.4.2/Metahub-0.4.2-x64.dmg"
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
