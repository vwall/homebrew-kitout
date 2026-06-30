class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v2.5.0/kitout_2.5.0_darwin_arm64.tar.gz"
      sha256 "c29f96e5053b23d2ca1bea43152d7ab0fc567b56f7a1ecd52588707f030f3746"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v2.5.0/kitout_2.5.0_darwin_amd64.tar.gz"
      sha256 "c935f18b53f88f38a43e9073d3ec6d2fc559d18c134dd56fcea3655eb780ea76"
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
