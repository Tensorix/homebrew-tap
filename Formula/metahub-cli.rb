class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.5.2"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.2/metahub-darwin-arm64"
      sha256 "833f494f3a943b4dfc868cf7209b78b899add1cd43e7c02724cbbfd2c84e8f30"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.2/metahub-darwin-x64"
      sha256 "9a88f491761fc8939220a5a40cb950868671970c317884c61fe2ffbcaa27e0b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.2/metahub-linux-arm64"
      sha256 "a64d9e3f6b084d53abd981691c36af29ff88dcf21d76a7e6de3dc530d7eff0e1"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.2/metahub-linux-x64"
      sha256 "fd0a42f27e8ee5485bef4abd01a203bd9b0fe663c9a7ad12a31751425ee67365"
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
