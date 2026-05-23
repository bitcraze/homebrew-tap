class Cfcli < Formula
  desc "CLI tool for Crazyflie drones"
  homepage "https://github.com/evoggy/cfcli"
  version "0.10.1"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/evoggy/cfcli/releases/download/0.10.1/cfcli-aarch64-apple-darwin.tar.gz"
      sha256 "92d2a6a481d06aaa9c72da0da8d1884f6a83a7760cf82e23ccfa645fa7041ef9"
    else
      url "https://github.com/evoggy/cfcli/releases/download/0.10.1/cfcli-x86_64-apple-darwin.tar.gz"
      sha256 "d6d6f2ed1cb4782a6e031f0f536f6d4926ac52da4672ad0b18f18655b99da5b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/evoggy/cfcli/releases/download/0.10.1/cfcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e58450f1c32d0ec73bd5e13bf80c111af393e03cce85d24208d233d976cbe62d"
    else
      url "https://github.com/evoggy/cfcli/releases/download/0.10.1/cfcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2686e8566f9b10e4bdbea0155fa285e4801d64593e8a8c31437b330436c18811"
    end
  end

  def install
    bin.install "cfcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cfcli --version")
  end
end
