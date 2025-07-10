class Celocli < Formula
  desc "CLI Tool for interacting with the Celo protocol"
  homepage "https://docs.celo.org/cli"
  url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%407.0.0/celocli-v7.0.0-c04f96f4b-darwin-x64.tar.xz"
  sha256 "e2fad3fa4a75170f69e61f1c6e3071c4a00839c79573e9171cce1d6401e4a0c5"
  version "7.0.0"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%407.0.0/celocli-v7.0.0-c04f96f4b-darwin-arm64.tar.xz"
      sha256 "dff519dfddd832b65875555694622475275980e2001524ee24fddf223222a07e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%407.0.0/celocli-v7.0.0-c04f96f4b-linux-x64.tar.xz"
      sha256 "c399d667060535a13be560b2b298cfb5366bce66689da3ae93622a29ab7f875d"
    end
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%407.0.0/celocli-v7.0.0-c04f96f4b-linux-arm.tar.xz"
      sha256 "8cc5b1d4bb920c3fb3ec2e13bcbcf6a36b2859fd3ef7a8a637e2c7de060e549e"
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