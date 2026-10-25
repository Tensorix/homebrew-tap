class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.5.6"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.6/metahub-darwin-arm64"
      sha256 "f055fa5c5575b1a0ab18d43fb79e7b5d334b02ebdf05e45afe4fe8da9f6676a9"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.6/metahub-darwin-x64"
      sha256 "d18cdc8c8a96ec520f0a9aad0877f97b8fc37642455b985a8888da2a1c109a93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.6/metahub-linux-arm64"
      sha256 "3388ea2c1b47aaffd91207fa0bd5548d4a914ea2a310dc46e565d887f43d6a73"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.6/metahub-linux-x64"
      sha256 "b61c07b4b5a9df53b69361edc7d2f5d0401e7afee201b2771680800237e35791"
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
