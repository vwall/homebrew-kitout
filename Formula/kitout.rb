class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v2.1.0/kitout_2.1.0_darwin_arm64.tar.gz"
      sha256 "0b348f5919b8ffd4ce19672885e788572f21aacc82c742d10ae4248aeeca319f"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v2.1.0/kitout_2.1.0_darwin_amd64.tar.gz"
      sha256 "c0d74f2db0dd26bd7536837afb693ed529f053405c577b56e3259320b6be6869"
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
