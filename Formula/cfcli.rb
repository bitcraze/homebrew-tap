class Cfcli < Formula
  desc "CLI tool for Crazyflie drones"
  homepage "https://github.com/bitcraze/cfcli"
  version "0.16.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.16.0/cfcli-aarch64-apple-darwin.tar.gz"
      sha256 "779626578dee089e0e77d1dbc9587892aaf76df8f23a31920a3a7c23b0291a2b"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.16.0/cfcli-x86_64-apple-darwin.tar.gz"
      sha256 "0bfe42e9b43c3a98ca6ba3e40649fae3acf068f6aa3aa187aba959b88203495d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.16.0/cfcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e71b831454cd6bb9d37c46aa16ca928a78f08475c34d9960d617919894b48091"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.16.0/cfcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c417667c3bd092495fabed05d7cf629e5d393a2c3299afa86f665d20e1a1baeb"
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
