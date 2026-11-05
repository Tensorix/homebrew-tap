class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.6.0/metahub-darwin-arm64"
      sha256 "ee24e243f65c1380a4803c61b38803cddc212c161074c1c35fe9b3ead74ab4ba"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.6.0/metahub-darwin-x64"
      sha256 "20e7f9d5531a781d07d2cee03933768cdf71b2fe90fb7f53939d9ed0b8796d08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.6.0/metahub-linux-arm64"
      sha256 "4164453e535de37ea58e1f4e200c48c3e2c7dd68d1fbb0bda3a27abcd19b722e"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.6.0/metahub-linux-x64"
      sha256 "31cb13499d5a8aa01ed93a2562ccc92268fe09b4d53249e0aa9cf680911f3e4c"
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
