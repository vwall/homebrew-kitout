class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v1.3.0/kitout_1.3.0_darwin_arm64.tar.gz"
      sha256 "a562fcb1e5356d5154515fafb4f3ea16fb869f9dddd662b2c1000619b2c0564e"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v1.3.0/kitout_1.3.0_darwin_amd64.tar.gz"
      sha256 "27ee93702f22ac28f6410e6e65f5f0efadb8dcd370d94a39edfab45095333eca"
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
