class Pppp < Formula
  desc "Standalone T1K8 notification and audio CLI"
  homepage "https://github.com/ut0s/homebrew-pipopapo"
  version "0.1.1"

  on_macos do
    url "https://github.com/ut0s/homebrew-pipopapo/releases/download/v#{version}/pppp-v#{version}-macos-universal.tar.gz"
    sha256 "a3d6b63ea36d74f6bce3548528f3161f971f9e1172f5eee881d14f6f73be1e30"

    depends_on macos: :ventura
  end

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
