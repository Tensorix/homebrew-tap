class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.5/metahub-darwin-arm64"
      sha256 "0e5d62b9f7f1c97bed924c0b8cfc37e9c1984b604e2aea0c31b3657ee7fd4b08"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.5/metahub-darwin-x64"
      sha256 "568960e7d27d5fce8ea22daf538f611009e27eec2f5624798f9f9838a38c27c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.5/metahub-linux-arm64"
      sha256 "f322a5f42c761a3c857378736ff0935127747b6138970b7345ce4807338b4a55"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.5/metahub-linux-x64"
      sha256 "67f217b58e26e0c47612b386e10d531d4aef679818e31c9125887c615e1c3aa6"
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
