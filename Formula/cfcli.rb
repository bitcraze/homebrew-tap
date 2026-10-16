class Cfcli < Formula
  desc "CLI tool for Crazyflie drones"
  homepage "https://github.com/bitcraze/cfcli"
  version "0.18.0"
  license "MIT OR Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.18.0/cfcli-aarch64-apple-darwin.tar.gz"
      sha256 "0dff2a9fa5b1aec89c89b8d5a77b4b7a14148184cf97fcd08e12caf80672e621"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.18.0/cfcli-x86_64-apple-darwin.tar.gz"
      sha256 "0c12824970b1d856a87ea82ac49bdf7af70053c3127d8cc52b4cfe11c15527a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/bitcraze/cfcli/releases/download/0.18.0/cfcli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a392cb1fb4b81e4f7780488f8a4be8bf736e28a449523e42fdc5693b6ac6221"
    else
      url "https://github.com/bitcraze/cfcli/releases/download/0.18.0/cfcli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "273c6b19f1b94b1b3c1d504f2782fcabcb310b78a17af6436a78e043e98bd106"
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
