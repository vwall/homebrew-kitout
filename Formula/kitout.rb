class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v1.1.1/kitout_1.1.1_darwin_arm64.tar.gz"
      sha256 "4edf2cee25f1fbdff6be38fcd29fa8cb140fa55e0d1cd0706867ac7a986218d4"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v1.1.1/kitout_1.1.1_darwin_amd64.tar.gz"
      sha256 "76b9ea2464fbc6a8db5400bc25d3fda7832fedb40960d9f9664b9b03453b646c"
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
