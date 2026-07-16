class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.3.2/metahub-darwin-arm64"
      sha256 "2b01853c52fc9b006dd21f106c7ecd3883d7a05e7e6ccc0ae9846cfedd1bbd5a"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.3.2/metahub-darwin-x64"
      sha256 "f12bf18ea591e38ecb87d497811e498010847ce3460d6936ffd1a4ed8bc23143"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.3.2/metahub-linux-arm64"
      sha256 "880fa45fb7f550a5f22e195e1446a38decfab46053a44555b8a7eeede7df4e52"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.3.2/metahub-linux-x64"
      sha256 "ed42d6609818fdbc30986ef1e9d566c62e6bd618db25576e751c7a5af2c620c7"
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
