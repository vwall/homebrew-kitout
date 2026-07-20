class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v2.6.0/kitout_2.6.0_darwin_arm64.tar.gz"
      sha256 "2b152e6d993114e663215fa678ea28431142c13b04aba50a44e1c92186179e31"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v2.6.0/kitout_2.6.0_darwin_amd64.tar.gz"
      sha256 "aa72ec5de094f394b770cc95a0d92cb3382aff291e4f6ebdb9d827188281150d"
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
