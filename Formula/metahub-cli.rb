class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.2/metahub-darwin-arm64"
      sha256 "bbd77efc9bf84d45e6980bafba188d4f4e880edba807b07ff628d6e1dc2cf906"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.2/metahub-darwin-x64"
      sha256 "970951ab5120142aabd961dbeb878bd66b089f87fc25430175f1bf765508052d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.2/metahub-linux-arm64"
      sha256 "b3a6cf57057e9b75f911fa322e0e542e76693919d10d3d571cc9b10204cdcefa"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.2/metahub-linux-x64"
      sha256 "7ff79ecf0bca066ab551a5d91e6be18cfac9abad35e40dec8673aa323ed43d87"
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
