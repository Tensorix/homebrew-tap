cask "metahub-app" do
  version "0.1.2"

  on_arm do
    sha256 "151811b8e07ebd1e80298440665df1972bb3eab34ef4e8191e6a3077d5fe8127"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.2/Metahub-0.1.2-arm64.dmg"
  end
  on_intel do
    sha256 "f4228a9c7091e8b9c277c3084d6c6894cfcfbc35aacebe30a947f7785098e9a7"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.2/Metahub-0.1.2-x64.dmg"
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
