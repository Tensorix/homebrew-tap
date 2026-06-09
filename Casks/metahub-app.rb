cask "metahub-app" do
  version "0.1.3"

  on_arm do
    sha256 "2f5a4d0bbe98fa11ab1333d725eab51556a19ce0552c76209c04a9b84f49b36a"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.3/Metahub-0.1.3-arm64.dmg"
  end
  on_intel do
    sha256 "57bfb7c0d0753d4706aab05266215e21b1bdbbcc0e03d96fcf2c8a63ac968ce8"
    url "https://github.com/Tensorix/metahub-core/releases/download/desktop-v0.1.3/Metahub-0.1.3-x64.dmg"
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
