class Cfcli < Formula
  desc "CLI tool for Crazyflie drones"
  homepage "https://github.com/bitcraze/cfcli"
  version "0.11.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.11.1/cfcli-aarch64-apple-darwin.tar.gz"
      sha256 "bf73b7640548e4ce6fd7c46d52c64cf0f02ef80570f3f496c4e1f00b54a99f36"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.11.1/cfcli-x86_64-apple-darwin.tar.gz"
      sha256 "4c4b66fa4fb4220126579855d00c8ef98120ce571b63ef59aa7eba6b7f5d333c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.11.1/cfcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c4f54c62fbbce1b58118f879270bb45c193c20d7b8383901c8e55981ce9bb4d"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.11.1/cfcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a66bfac26790b276152797d671b95976bba600044e1d5241a23485879d3e9139"
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
