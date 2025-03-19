class Celocli < Formula
  desc "CLI Tool for interacting with the Celo protocol"
  homepage "https://docs.celo.org/cli"
  url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.1.0/celocli-v6.1.0-c7514dd94-darwin-x64.tar.xz"
  sha256 "b4b99439fc544f14030b30a5d3d4fa7830159bcec13968939d442299498ab4b5"
  version "6.1.0"
  license "Apache-2.0"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.1.0/celocli-v6.1.0-c7514dd94-darwin-arm64.tar.xz"
      sha256 "fbd82d21c1bb93ce803f2c3dce4fc11791cab97352b7af2ecbdaa33ef4fe1425"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.1.0/celocli-v6.1.0-c7514dd94-linux-x64.tar.xz"
      sha256 "79b99d873a2763978a8d6a8e3d5d30126180d625f9d17b43e45ad9ccd92861e3"
    end
    on_arm do
      url "https://github.com/celo-org/developer-tooling/releases/download/%40celo%2Fcelocli%406.1.0/celocli-v6.1.0-c7514dd94-linux-arm.tar.xz"
      sha256 "155208d104c6d8cf3854a46ff6c159c984ceaadec6e0ee4f71e2f11ab583db80"
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