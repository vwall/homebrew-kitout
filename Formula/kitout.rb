class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "2.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v2.7.0/kitout_2.7.0_darwin_arm64.tar.gz"
      sha256 "1e7569b45799b24a8467e9bac2aedce437ea1ae7480f9763aa8460f87ccdee23"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v2.7.0/kitout_2.7.0_darwin_amd64.tar.gz"
      sha256 "0b07d679f587f569ffd82612b9cb6a159271f37b7cc23b77ed935e73faac7435"
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
