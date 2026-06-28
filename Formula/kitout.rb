class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v2.2.0/kitout_2.2.0_darwin_arm64.tar.gz"
      sha256 "b26a77f02962da0c6522aefa479868c2818ee860c1f6025b10910ab5e6581edd"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v2.2.0/kitout_2.2.0_darwin_amd64.tar.gz"
      sha256 "78a53b3b0ec5dc2509765228ffc759fe54a2ebd8729a9c8d46ecf6f9e9fbae8f"
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
