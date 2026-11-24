class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.6.2"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.6.2/metahub-darwin-arm64"
      sha256 "f9853dfa22b7e1936b1bffa9e03e6f30ea12ff5663cb6e94203fe05a883e24c8"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.6.2/metahub-darwin-x64"
      sha256 "3a71e4a3e473f0f60373b2eec7765482e2fc5c9f080480917a4291ed1f65262b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.6.2/metahub-linux-arm64"
      sha256 "262caaafb5d35140b60760669b28fb6243bede25670d299c02d10c7046b0ad1d"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.6.2/metahub-linux-x64"
      sha256 "176cc4a396f3e90eae0f22dbc518f5a65f388dd9b58c8acc8abea745548ca529"
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
