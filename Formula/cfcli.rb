class Cfcli < Formula
  desc "CLI tool for Crazyflie drones"
  homepage "https://github.com/bitcraze/cfcli"
  version "0.14.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.14.0/cfcli-aarch64-apple-darwin.tar.gz"
      sha256 "24af1192b5bfef5a3348d0678610a8b71482040cd2e8021c88878f8e78afc578"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.14.0/cfcli-x86_64-apple-darwin.tar.gz"
      sha256 "151e5120eb3b8585989ec6be513290bd97d23759f44627284e535896860c3afd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.14.0/cfcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac81cb1f63ccedf4286b037f3acff48e3b98051de8e88fa8b4f5b3433e4a0ddb"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.14.0/cfcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "648867bebde2e9dc192c9be2e40f9ea8871a10f1a5e1a8cfd5b6b9d00a1f1c89"
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
