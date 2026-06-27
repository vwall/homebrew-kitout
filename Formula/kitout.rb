class Kitout < Formula
  desc "Declarative setup tool for fresh Macs"
  homepage "https://github.com/vwall/kitout"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/vwall/kitout/releases/download/v2.0.0/kitout_2.0.0_darwin_arm64.tar.gz"
      sha256 "94f1c41f3d634cbad351d19dddb978efa370dee68bf03ac97c108caaaf932b91"
    end

    on_intel do
      url "https://github.com/vwall/kitout/releases/download/v2.0.0/kitout_2.0.0_darwin_amd64.tar.gz"
      sha256 "3bf66fdcf88d7a79203a0bf4b6c13b7681cf42c775df3e0677f3357fc9d7057c"
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
