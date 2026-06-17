class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "1.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v1.1.2/kitout_1.1.2_darwin_arm64.tar.gz"
      sha256 "7fad9a46dc51d044c1ad43094b57e346d00419eaa12cf633f852b96c6f2c70fa"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v1.1.2/kitout_1.1.2_darwin_amd64.tar.gz"
      sha256 "7e9f81ac0d93612b21191a2dec8f7a31e8724a62beb2c8bbb18306d9740eef71"
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
