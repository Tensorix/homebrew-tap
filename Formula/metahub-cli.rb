class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.4.1/metahub-darwin-arm64"
      sha256 "c1668523d93c2d66bc9d3da3b4fce77ab8686a3342e67677a2d478cd52455d67"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.4.1/metahub-darwin-x64"
      sha256 "8352580ac75f14e1c254e89fc2a870bc264efd358b6117635bd4d201b606e10c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.4.1/metahub-linux-arm64"
      sha256 "038688659f2a23fa83dc807abaf2802dffd2a621e7dce085a1eef5791c2e2140"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.4.1/metahub-linux-x64"
      sha256 "36c6e896268df7aaf5e533d0538b0196cfd8d47c0c4c7b40f4a03b1c6ad7f02d"
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
