class Celocli < Formula
  desc "CLI Tool for interacting with the Celo protocol"
  homepage "https://docs.celo.org/cli"
  url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-darwin-x64.tar.xz"
  sha256 "a45eb648a65daef23ac9af8c3b5399f5e83fc6b209508d1a686f48885c43bf4c"
  version "6.2.1"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-darwin-arm64.tar.xz"
      sha256 "f613b794ae780a90cbcbeaf56e9e65ff860631d143fa4a7c2d7535606449ec84"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-linux-x64.tar.xz"
      sha256 "627b1a6b38df132611b38fe8fbd33cb9a09e7e3834b189aef753721ee7810051"
    end
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-linux-arm.tar.xz"
      sha256 "c1d215bee10df5ea4b3774ef9967fdba0a67c73eaf379c737d7a084efc1f233a"
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