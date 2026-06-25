class Cfcli < Formula
  desc "CLI tool for Crazyflie drones"
  homepage "https://github.com/bitcraze/cfcli"
  version "0.12.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.12.0/cfcli-aarch64-apple-darwin.tar.gz"
      sha256 "765de8846a14badbbf233a350b72b55940c0d33ad08d3ef89f79efa93fbaf9fd"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.12.0/cfcli-x86_64-apple-darwin.tar.gz"
      sha256 "53df4fc2bce835fc15f48d23d90ff9d621824402b27b546da6c35faf97f29ec8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.12.0/cfcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c3e409833e54f47730bced6d543121b61952647e5a3ec8d937b679c1361ee026"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.12.0/cfcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe72da7a9929cf35f207cb15cf6282daff8c15beecd0b8ecd361d905ed7e00bb"
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
