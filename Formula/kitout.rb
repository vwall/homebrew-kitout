class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v2.3.0/kitout_2.3.0_darwin_arm64.tar.gz"
      sha256 "457b32b3dbe5124323b830599015cd350f75dbc6649f3207f7bab13a4e71a1ed"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v2.3.0/kitout_2.3.0_darwin_amd64.tar.gz"
      sha256 "ce4f90f2a77b0983a8561ea608555d3cf473d71d326958c711d12414f0d37943"
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
