class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v2.4.0/kitout_2.4.0_darwin_arm64.tar.gz"
      sha256 "69ee3d5b02261bb0f436b15559d14ce65461d3c7a099861eca071b580049e261"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v2.4.0/kitout_2.4.0_darwin_amd64.tar.gz"
      sha256 "2621d2fa7c1af293c281c9434ccdda0f17e3e48a2ea7afe1633a63335ee34cc5"
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
