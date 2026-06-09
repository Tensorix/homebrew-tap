class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.9/metahub-darwin-arm64"
      sha256 "259210a52ced0cc3c1199f5159c1ac8f7f89cd184549d3be46565bcce3142fa6"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.9/metahub-darwin-x64"
      sha256 "b1d4cf5864d7cc0d1ce5fb83b43cc99f5b2d64c1c5641c3c9b3df3f92cda45dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.9/metahub-linux-arm64"
      sha256 "97cbdf9b71519bcd8c71ec299da646e363b778da2ce5549f32b59860b1f37284"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.9/metahub-linux-x64"
      sha256 "b68ac635542e96bbced16f01fcdd7061ea1b8f6f72dc9dff7c786af489f52574"
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
