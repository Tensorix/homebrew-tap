class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.11/metahub-darwin-arm64"
      sha256 "b292c03f4d61352184278238f88a62a81add6c9ed8060d921be3eb0735c5adeb"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.11/metahub-darwin-x64"
      sha256 "6285db3ee3dfb26645304fe750f2f26d8547bca675032f6bdbb709ddb35cb741"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.11/metahub-linux-arm64"
      sha256 "afef01d4e8d851005553b3374438a977ca4fb0a5a91d0e2c4d031b0f29508a98"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.11/metahub-linux-x64"
      sha256 "0f3e9fb2cc97dc0f7a3448b4e4e6c37b05c7ccb2f674db8aaadee386387f268f"
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
