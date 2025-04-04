class Celocli < Formula
  desc "CLI Tool for interacting with the Celo protocol"
  homepage "https://docs.celo.org/cli"
  url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-darwin-x64.tar.xz"
  sha256 "17cbdbef4763e1abb607d01e6d7b7d349bf0fefdb66c95665cc7c30fa9c54290"
  version "6.2.1"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-darwin-arm64.tar.xz"
      sha256 "dd979bd64e2298408a0c7e1c55e6b63dead3e1bd929f2282cc634c829ee69f19"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-linux-x64.tar.xz"
      sha256 "1365b1cf27813443297dc573175559d5651802cdf99c1d901b9fc1b51c0a3aed"
    end
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.1/celocli-v6.2.1-a52643b35-linux-arm.tar.xz"
      sha256 "fd7ea936a74f34ed2904b672d0ad5fe9f8c2a7c421d9bb3cb673d6cd58c7c1dc"
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