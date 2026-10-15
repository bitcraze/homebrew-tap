class Cfcli < Formula
  desc "CLI tool for Crazyflie drones"
  homepage "https://github.com/bitcraze/cfcli"
  version "0.17.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.17.0/cfcli-aarch64-apple-darwin.tar.gz"
      sha256 "a9751192cccd06ec76ded5a856d6a58e35267162d2f658996877ac278ec58da1"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.17.0/cfcli-x86_64-apple-darwin.tar.gz"
      sha256 "b24524ea90bc75d7b71940daf3069b29ceb8a82d9f8ab3089abfc93e2ab4999e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.17.0/cfcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc6f52ec941b1c47d879d54db6d32e6a7ed78749261a5bb7da8322d3c3c3f360"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.17.0/cfcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48589811067ca6874389e2535fae48d128ba295f97556116b0b22fde2eb76158"
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
