class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.4.0/metahub-darwin-arm64"
      sha256 "330189e52409201984e88393c43fde6e749d8d4f9c89f7ec421ad4cae02cd647"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.4.0/metahub-darwin-x64"
      sha256 "3bb3626ddc11866fc398798671934fd34fa5565b995d923be4546a01fa59339e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.4.0/metahub-linux-arm64"
      sha256 "da4775fe3dd956dd9dc5cf162a1579be444b8c6bf650b2dc0644243911052bad"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.4.0/metahub-linux-x64"
      sha256 "d0bc49d2d4bd533e2391e7d7998902a60557a2e16708eaadcba98e92c76d93e1"
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
