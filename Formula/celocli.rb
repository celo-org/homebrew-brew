class Celocli < Formula
  desc "CLI Tool for interacting with the Celo protocol"
  homepage "https://docs.celo.org/cli"
  url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.5/celocli-v6.2.5-936753aec-darwin-x64.tar.xz"
  sha256 "3505fa406a33152b6eb66f9f5664d986f54cf968335b6dbb683d45c38d0de0e4"
  version "6.2.5"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.5/celocli-v6.2.5-936753aec-darwin-arm64.tar.xz"
      sha256 "285894ee92be2b98152d26d0c47cdf647396998843dac4e42a9e8d495c579575"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.5/celocli-v6.2.5-936753aec-linux-x64.tar.xz"
      sha256 "19312822abdf415b56550015727653ca88e9228d404fb4795be4ef398b75d05a"
    end
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.2.5/celocli-v6.2.5-936753aec-linux-arm.tar.xz"
      sha256 "eac6fa7985466a540a219e436e22678f8223c2767529874e6f9279ca693395aa"
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