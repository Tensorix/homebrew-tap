class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.5.7"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.7/metahub-darwin-arm64"
      sha256 "c7d84d96538a8a665363e9aa33feba3182516ff7dfd1e68c7ddf5ec79fa6427b"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.7/metahub-darwin-x64"
      sha256 "fe65ed34c38205146958d384ff67979cf16d93859d705463c445c4b711cca067"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.7/metahub-linux-arm64"
      sha256 "7d20bbcf4bd4c6c60549a7acee8b4cdb2b730116dce4f79cd70b107c345627ea"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.7/metahub-linux-x64"
      sha256 "c105a5f23af2e084452c5741ba02a0860f632ebfcc1a6591a897983f3a5669d6"
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
