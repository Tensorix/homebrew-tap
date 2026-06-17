class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.0/metahub-darwin-arm64"
      sha256 "d3c6ec3e8a995d7dc23e611122fa901c6767cd6260ef95a680c7b1333cb817b7"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.0/metahub-darwin-x64"
      sha256 "fcada531e7ecc899b25ac1343a128d59eca944fa3fe0f80f4990fac03195c417"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.0/metahub-linux-arm64"
      sha256 "fcaeef7257716132b0db6bfc2f2a433749d6af0fb717eec48eac4cbeed6e2cf1"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.2.0/metahub-linux-x64"
      sha256 "549deaab91aec3c32385581caf71e500e2b4918df7a9b1a824e213662bff96e5"
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
