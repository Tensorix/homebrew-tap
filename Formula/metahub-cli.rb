class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.1/metahub-darwin-arm64"
      sha256 "02b893be219d48eb32e677d82d26a4cbe4b75cd7336cd71f15a28b80086ae3e4"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.1/metahub-darwin-x64"
      sha256 "b30b9df98d6b4535ad389479ba594aa5bc445738759ac9017662b02faef97bd2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.1/metahub-linux-arm64"
      sha256 "11f686b2c7f2ca7e02735c63f9e90cf08bc0a01a11fa3b7f36eb3f0fe2374fcf"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.1/metahub-linux-x64"
      sha256 "ff3b593e3da6cbaa0121ffa910fd7557e48ad43615a8f38978df09101c235bb8"
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
