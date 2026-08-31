class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.0/metahub-darwin-arm64"
      sha256 "09e8cd947c79a0a5ad0fa01f773d8690f00ad842da02f7a07b3ff9bf345dce09"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.0/metahub-darwin-x64"
      sha256 "966eed91c8e54d366f38d563d6f990ab128e0aaad4bd0cea257549480bbac820"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.0/metahub-linux-arm64"
      sha256 "ff9a0584e49b9a0a628145e81c3d8930535e2b567e6957a0b60f6abb12d336dc"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.0/metahub-linux-x64"
      sha256 "8c7bd46c40ccd97ff7c674218a4f1365dd7fa51521c63bbca1617348b5eb9ab6"
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
