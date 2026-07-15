class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.3.1/metahub-darwin-arm64"
      sha256 "4d232e3602a157885c2aada08c834c76b4b05faec9e7962b74e95c8f0348b758"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.3.1/metahub-darwin-x64"
      sha256 "453c68b5e3bacaa3ab3e8707be71995340d7ec441cabf0adc06601f830264996"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.3.1/metahub-linux-arm64"
      sha256 "8a541b157080d3e1030c75e748bd36f308b286f3d87da9888257552e85e2e0fd"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.3.1/metahub-linux-x64"
      sha256 "63098fb8feb505e9633eeba4579765c3499d4bfcfda33f482669b9e89ba6a439"
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
