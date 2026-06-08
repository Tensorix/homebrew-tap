class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.5/metahub-darwin-arm64"
      sha256 "b2f241cde2ea6b99d13ed7871cb7748722a7f2f87889fb27c2833ffe1b48607a"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.5/metahub-darwin-x64"
      sha256 "887a9a7da2798e644dc2d5a276bc1897c737af01cce4663a7e071eeaf52765a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.5/metahub-linux-arm64"
      sha256 "5472da4b67959eb2edf6b69394d9d901ef9518918a3bd74c1ffe0a864af779d8"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.5/metahub-linux-x64"
      sha256 "0541cdc6d61e57a434e9b0f4fd60fe3c052da5f292867e7ba04e705339108daf"
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
