class Celocli < Formula
  desc "CLI Tool for interacting with the Celo protocol"
  homepage "https://docs.celo.org/cli"
  url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-darwin-x64.tar.xz"
  sha256 "847ad9d33085ac39c08eca8e7a5a2e821a7385b0ab4dc8b432f7cbd7f049ec1e"
  version "6.2.1"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-darwin-arm64.tar.xz"
      sha256 "6499e32076a7ecd5d2d14378cac2644f2f31d3ade38316b6e02b770bc54d5a5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-linux-x64.tar.xz"
      sha256 "8c6b158d0291f43c6915c28f5492ebffce9e2acf81df2154c973dd994ae0351a"
    end
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-linux-arm.tar.xz"
      sha256 "623ad97baedc775f5e9983a480e7d03f41bb1c62012511603db6fe3e52cd42ce"
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