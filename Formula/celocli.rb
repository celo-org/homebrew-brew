class Celocli < Formula
  desc "CLI Tool for interacting with the Celo protocol"
  homepage "https://docs.celo.org/cli"
  url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.3/celocli-v6.2.3-346ef51a3-darwin-x64.tar.xz"
  sha256 "da2525fa02291b5820341afc457ed4eabf5487416c6cd4b1c40744efb575fd7e"
  version "6.2.3"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.3/celocli-v6.2.3-346ef51a3-darwin-arm64.tar.xz"
      sha256 "09aa463b019171e019ac83b8fb006c56273b2688317c2e1247d4223352db30f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.3/celocli-v6.2.3-346ef51a3-linux-x64.tar.xz"
      sha256 "cb55e1dfe1f6ccd9c2b53014fa863239fddfa3edae40f457d6d2a27e9d66c951"
    end
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.3/celocli-v6.2.3-346ef51a3-linux-arm.tar.xz"
      sha256 "5b6041df557c9ac4985c4e8a09ac5104f0b418ce5ac55314fe6c799129f63ed8"
    end
  end

  def install
    inreplace "bin/celocli", /^CLIENT_HOME=/, "export CELOCLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/celocli"
  end

  test do
    system bin/"celocli", "--version"
  end
end