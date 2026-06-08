class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.7/metahub-darwin-arm64"
      sha256 "cc89c860435d9792c6a1624c145c6b1b083f48ba1edd51a33d4d0b413e10b208"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.7/metahub-darwin-x64"
      sha256 "9720e2bd14cdb5d8fec16408d80220b2f5bc9274ff25eb925ce6472ca55507d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.7/metahub-linux-arm64"
      sha256 "be860303f71465a24c8b79e87313a40e08c11bd61d6a0ffc41351716c606371e"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.7/metahub-linux-x64"
      sha256 "e91c16d3889f8f4c65cdf8fa0a811dc476a2f87ce9b99ccf5f5b491b3d44ca50"
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
