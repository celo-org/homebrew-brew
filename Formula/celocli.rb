class Celocli < Formula
  desc "CLI Tool for interacting with the Celo protocol"
  homepage "https://docs.celo.org/cli"
  url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%407.0.1/celocli-v7.0.1-97d335b47-darwin-x64.tar.xz"
  sha256 "fff02f91dcdf8ee7e883dac7be8cbfdfe0ca9c744c4b064d44987e84ee2a2faf"
  version "7.0.1"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%407.0.1/celocli-v7.0.1-97d335b47-darwin-arm64.tar.xz"
      sha256 "89ab3e54de17129cdde082bc8196149c3f65396b4adf2fc12963ef452016362c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%407.0.1/celocli-v7.0.1-97d335b47-linux-x64.tar.xz"
      sha256 "11c362f9e5829e3861c04f1aa6bbb4819d1a4429f13fd9a893f01cc00068accd"
    end
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%407.0.1/celocli-v7.0.1-97d335b47-linux-arm.tar.xz"
      sha256 "2442a91207e0b3d5dd52b20477331c7f6147adcf02d8b73e6c6f221aa11b82c3"
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