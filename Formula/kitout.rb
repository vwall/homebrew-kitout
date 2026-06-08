class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v1.0.0/kitout_1.0.0_darwin_arm64.tar.gz"
      sha256 "1ad8db8b559722addf3871e21f75af4b86a5bad1f1dd00d486c04337dbf95a0e"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v1.0.0/kitout_1.0.0_darwin_amd64.tar.gz"
      sha256 "9a40b74cee333929072b9dbab07707857b8d8eccde6eca9f953485ebabf0236a"
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
