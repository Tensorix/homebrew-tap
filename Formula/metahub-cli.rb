class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.10/metahub-darwin-arm64"
      sha256 "2d11f64c69093421b41c0495d050c84a9edb25490039df9abf0daee540835489"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.10/metahub-darwin-x64"
      sha256 "ecc8611ef0bb3327f1908a2b248b7222994b1fd8221d87af28e9e503cde21264"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.10/metahub-linux-arm64"
      sha256 "4941c0cd1b4dd8a3a0b9288baca3bc4e543219d495e68c2fd86b7626e1198f93"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.10/metahub-linux-x64"
      sha256 "07f7b2788d9c4d742ee542efb1489eb012f6404e9bb4d06b43be389ad03738aa"
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
