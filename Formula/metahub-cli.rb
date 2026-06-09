class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.8/metahub-darwin-arm64"
      sha256 "4579ac38d3b6ffdc9d9880ab25301d07c55c9b5d790c8c72faae9e021be535d5"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.8/metahub-darwin-x64"
      sha256 "b1a17ccc62c1b8bcbe0f397e81047e07d812bb77dea036d70c6c9073ce65e3e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.8/metahub-linux-arm64"
      sha256 "04663ad0d7993fb8413c6cb21a3dc24b3d86bbd551e0e0b30ceffdf92f7fb2b3"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.8/metahub-linux-x64"
      sha256 "6a13f16791696186856bdb4aa35ba3bf9d7e26a0862b41337be58c36d943a281"
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
