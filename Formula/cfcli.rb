class Cfcli < Formula
  desc "CLI tool for Crazyflie drones"
  homepage "https://github.com/bitcraze/cfcli"
  version "0.13.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.13.0/cfcli-aarch64-apple-darwin.tar.gz"
      sha256 "281a6a7c9790174b399c042e765f66b908329eb6d9241ba7bed17b1c636cfbbd"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.13.0/cfcli-x86_64-apple-darwin.tar.gz"
      sha256 "4533e5ad8c8766e6946db59994b897f7008929ee04214fae76452d46b74a207e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.13.0/cfcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed8b962b8b8a7b033d678cf707438d37b7beefc5fb6d3dcab369333b989a39e1"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.13.0/cfcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1dd145a84bb9310518fa36f6b93f2dd8390afe6e3c88dea4d829d3cb0c9e5180"
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
