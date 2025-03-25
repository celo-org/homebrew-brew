class Celocli < Formula
  desc "CLI Tool for interacting with the Celo protocol"
  homepage "https://docs.celo.org/cli"
  url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.0/celocli-v6.2.0-8ed8706ba-darwin-x64.tar.xz"
  sha256 "38c807bae133fc5bbe8bc82a993b574e5ff73a785cf30026e00823c8e5107cbe"
  version "6.2.0"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.0/celocli-v6.2.0-8ed8706ba-darwin-arm64.tar.xz"
      sha256 "dbf8432dfd53d0a037d4d33f641462f09d859e7735afee4a604767cdc6eadecb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.0/celocli-v6.2.0-8ed8706ba-linux-x64.tar.xz"
      sha256 "611a8568717f1c7c601a09f5f146d701c04722e8a060be1a91560a56191d9bc1"
    end
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.0/celocli-v6.2.0-8ed8706ba-linux-arm.tar.xz"
      sha256 "f1c10a7c9cc44e92a3f4061810aa9686a863e846b9cf4b56c4b3cf7e3b4f9e6d"
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