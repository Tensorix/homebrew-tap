class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.6/metahub-darwin-arm64"
      sha256 "26d4854e89438f86dbdb57a79a7ae2ba0750825408b692ceb8f47cde10ae0f68"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.6/metahub-darwin-x64"
      sha256 "9e8ff8860208dffdbebfdcc550e811c239b259a7a1a3a1747026ff54fa185c50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.6/metahub-linux-arm64"
      sha256 "af5031b863ec7f827c8bafd898c9bafadb7baa6cdf6c8fc5a207676707bbeab1"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.1.6/metahub-linux-x64"
      sha256 "4c2a6a4324d1dcea889d920fe050404169a83a64340808be37adf17d14dd8ecd"
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
