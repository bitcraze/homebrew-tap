class Cfcli < Formula
  desc "CLI tool for Crazyflie drones"
  homepage "https://github.com/bitcraze/cfcli"
  version "0.15.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.15.0/cfcli-aarch64-apple-darwin.tar.gz"
      sha256 "0de3c1d345185912eaeca0d2339d2b6d826f09c441c141a4d8e886c5c6ee5f02"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.15.0/cfcli-x86_64-apple-darwin.tar.gz"
      sha256 "a23e4581ec6d6364d03615b53048b7d40e6af2eac35577e4803249bb975d27b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.15.0/cfcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b4bd40ebabe41035458fec7e60af30e41a6799209da62d23532ec9cebb4355b"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.15.0/cfcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b01de143ff2c65182bd06f9fce4b889cf2b788f43198220fbebfa0a1438ebd81"
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
