class Pppp < Formula
  desc "Standalone T1K8 notification and audio CLI"
  homepage "https://github.com/ut0s/homebrew-pipopapo"
  version "0.1.0"
  url "https://github.com/ut0s/homebrew-pipopapo/releases/download/v#{version}/pppp-v#{version}-macos-universal.tar.gz"
  sha256 "49bfbaf5c9c1e1f85d5131882f735591166e844a1096fb6e16fe466b16121fd6"

  depends_on :macos
  depends_on macos: :ventura

  def install
    bin.install "pppp"
    pkgshare.install "licenses", "README.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pppp --version")
    system bin/"pppp", "render", "Homebrew test", "--seed", "42", "-o", testpath/"test.wav"
    assert_equal "RIFF", (testpath/"test.wav").binread(4)
  end
end
