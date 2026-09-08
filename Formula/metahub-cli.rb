class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.1/metahub-darwin-arm64"
      sha256 "66620489b936742778db41bf2564465595c2a48a00b5f86b2e4f1216480949bb"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.1/metahub-darwin-x64"
      sha256 "a5d0b689d813db2f6cfa6e9c53b8506b3a11b4332785b48cd252679c97270e8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.1/metahub-linux-arm64"
      sha256 "cf7669ebb353e2cbd44b3d2eb182f989a2725250d26f2da581bffb73aa4d1c0a"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.1/metahub-linux-x64"
      sha256 "1009eda18fc72d5bc03e9dbaa7c77e31a25b7ed49574cdcda8dfbc3222aa73ac"
    end
  end

  def install
    # The release asset is a single self-contained binary; install it as `mh`
    # with a `metahub` alias (both bins the package.json declares).
    bin.install Dir["metahub-*"].first => "mh"
    bin.install_symlink "mh" => "metahub"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mh --version")
  end
end
