cask "metahub-app" do
  version "0.1.5"

  on_arm do
    sha256 "e4986e60e5b0fedd951317a53d3114a3f51926fa32791db1b7884572b7868b6d"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.5/Metahub-0.1.5-arm64.dmg"
  end
  on_intel do
    sha256 "e5f3097a83ad153aa0e9a3c36b62bf7600db404469e47dc4ccd956cb71de5e01"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.5/Metahub-0.1.5-x64.dmg"
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
