class Celocli < Formula
  desc "CLI Tool for interacting with the Celo protocol"
  homepage "https://docs.celo.org/cli"
  url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.2/celocli-v6.2.2-48f9c7f46-darwin-x64.tar.xz"
  sha256 "ea5837867be0248942eacb428f1c5cc4e5078567468462b66197fdde378f6bd1"
  version "6.2.2"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.2/celocli-v6.2.2-48f9c7f46-darwin-arm64.tar.xz"
      sha256 "839ef8325127460e1937cfe40ce858fed520798e05ae4e0b28f723161e734cae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.2/celocli-v6.2.2-48f9c7f46-linux-x64.tar.xz"
      sha256 "eb8bc0f218da08003e2676cdc541c59f718752ed1a5d32f984bcb9d11bf7df9c"
    end
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.2/celocli-v6.2.2-48f9c7f46-linux-arm.tar.xz"
      sha256 "04ef39938f071db9c6c7378f7866c3dc72b4f6bc43856f9782dc551a25cdda61"
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