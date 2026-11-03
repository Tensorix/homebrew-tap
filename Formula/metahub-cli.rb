class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.5.8"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.8/metahub-darwin-arm64"
      sha256 "6a2a30d79a56e8a33b2ddea8f239f342ebf8e2121f7db3309f1d968e0c212edd"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.8/metahub-darwin-x64"
      sha256 "9261b14593da85ef1f0bbe32e7816e102e546578eeb0af31d3ba459c0319c218"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.8/metahub-linux-arm64"
      sha256 "ef99e6df3df63c7468ba429730ba1fc64e7ad1f245ccaa6768daddfec9fab980"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.8/metahub-linux-x64"
      sha256 "25335c14c7509ba0b794003131f134a5e19264a08fd7ddfc0abf67eafb7d2f38"
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
