class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.5.3"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.3/metahub-darwin-arm64"
      sha256 "e01957d702feae1708803c00f594d7caf4b8877047ede20705b15b6af5f4e1fe"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.3/metahub-darwin-x64"
      sha256 "c2ee5d16b0f7b431e8eea76bef722955e6a7c26f94c05e2148cb6d65d6c28f1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.3/metahub-linux-arm64"
      sha256 "8794886ce956182a46cfd7b9743c5b2421fc0bf2758c457dabf1a4384f3a1045"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.3/metahub-linux-x64"
      sha256 "a8b015d9acb176833f07e65cc99ed35403ca9dfb02cf9b46e97b3819255e74c8"
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
