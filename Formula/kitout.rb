class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v1.2.0/kitout_1.2.0_darwin_arm64.tar.gz"
      sha256 "d66aa8f346c07f3a47f7d0d1781e08ac47ba1e5ce86aa4d61543d37ffdf68da3"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v1.2.0/kitout_1.2.0_darwin_amd64.tar.gz"
      sha256 "ba5d285c10f606c57dbc352d34d6d56df63986af13c6d672575ab7f7f9594965"
    end
  end

  def install
    bin.install "kitout"
  end

  test do
    assert_match "kitout #{version}", shell_output("#{bin}/kitout version")

    config = testpath/"kitout.yaml"
    system bin/"kitout", "init", "--config", config
    assert_match "missing", shell_output("#{bin}/kitout status --config #{config}", 1)
  end
end
