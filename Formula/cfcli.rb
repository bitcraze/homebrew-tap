class Cfcli < Formula
  desc "CLI tool for Crazyflie drones"
  homepage "https://github.com/bitcraze/cfcli"
  version "0.5.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.5.0/cfcli-aarch64-apple-darwin.tar.gz"
      sha256 "81774890865caf21d091cb9c4a4de647b3f3feef9693609c739c99fa6db6164c"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.5.0/cfcli-x86_64-apple-darwin.tar.gz"
      sha256 "5cd70403b9bb12fe58b85c9e54d586f331f2b06fa82f8c7da340e3a23d1c9b2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.5.0/cfcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "38fa117eb7473d53282401279e2ce54a48584950161bf5e68a14f5e0395928bd"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.5.0/cfcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bab6e0f562c0c42530e21d3ce69de64286b5c6d35d951b619b6177fe86c6e6ff"
    end
  end

  def install
    bin.install "cfcli"
    # Generate and install shell completions by invoking the binary itself.
    generate_completions_from_executable(bin/"cfcli", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cfcli --version")
  end
end