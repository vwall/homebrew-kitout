class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v0.1.1/kitout_0.1.1_darwin_arm64.tar.gz"
      sha256 "2264e29f62043cafb2ff7625d24bd273045443d2f5c43172ef1fcd213823f29f"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v0.1.1/kitout_0.1.1_darwin_amd64.tar.gz"
      sha256 "88ff21b801cdab5a39a17f478fcdb784a6bda2b031713a3bd669cccda223d06e"
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
