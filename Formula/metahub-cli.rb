class MetahubCli < Formula
  desc "Local-first typed knowledge base with CRDT sync for AI agents (CLI)"
  homepage "https://github.com/Tensorix/metahub-core"
  version "0.5.4"

  on_macos do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.4/metahub-darwin-arm64"
      sha256 "2666b5b38aef16858b4af3d8818c2fed225133be23954f7cb2a1ab2ac8909624"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.4/metahub-darwin-x64"
      sha256 "29f9107549f291cd7eec013208a3da56f63c3b5d2ed9fe771c58a8d7cd4e06eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.4/metahub-linux-arm64"
      sha256 "09113969fdd63744f4e11a0fe51a696c517ff95879e3e3d22005139d2538ad2b"
    end
    on_intel do
      url "https://github.com/Tensorix/metahub-core/releases/download/v0.5.4/metahub-linux-x64"
      sha256 "f2dacd65c1fbdc13bd7283cd76b5e3752f5c4061977b7505c9a5cb2af9db46b4"
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
