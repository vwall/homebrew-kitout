class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v0.1.0/kitout_0.1.0_darwin_arm64.tar.gz"
      sha256 "c287b830fe06fd0ada7b7223e17a4e8653645b1c407d986e5bc0c87c48a7029a"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v0.1.0/kitout_0.1.0_darwin_amd64.tar.gz"
      sha256 "8e74f7293ed94c28735f0641ab0f39fdcee9329e3b63418bd51b89ba92321ec5"
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
