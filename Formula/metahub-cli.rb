class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.4/metahub-darwin-arm64"
      sha256 "90ae583cbff1b96a79fffbd0f91546a9c85c725153b1ff2a6a8f7a9eab3d914a"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.4/metahub-darwin-x64"
      sha256 "8290d784299a7c25bb965313ee33220e80f0796079d136db440966a96b58d5af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.4/metahub-linux-arm64"
      sha256 "d2e24ad458b370920b6d3df7493c8e7a28e0fff63d5ea229406b314515152e10"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.4/metahub-linux-x64"
      sha256 "9c869d481c46b569a94635e86d24821263b92aa7de0aa671afc5cee57ddfc34c"
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
