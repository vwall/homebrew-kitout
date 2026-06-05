class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v0.1.0/kitout_0.1.0_darwin_arm64.tar.gz"
      sha256 "3d0d81efe9b235340e4a4a1fb641891637e8f68d3fd34b30a580c78cc1f150d0"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v0.1.0/kitout_0.1.0_darwin_amd64.tar.gz"
      sha256 "e5929a28bca39c7570295919a1559749de4f4dc3186bb61ac020768919f7f35a"
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
