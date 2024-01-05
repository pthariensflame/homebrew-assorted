class Unibetacode < Formula
  desc "Beta Code to/from UTF-8 Unicode conversion package"
  homepage "https://unifoundry.com/unibetacode/index.html"
  url "https://unifoundry.com/pub/unibetacode/unibetacode-2.0.1/unibetacode-2.0.1.tar.gz"
  sha256 "0fb3226de2f39616267c5daad8b0357b279074e109a2d968560f9f427f69d30f"
  license "GPL-2.0-or-later"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "check"
    system "make", "install"
    system "make", "clean"
  end

  test do
    beta = "*(o bi/os braxu/s h( de\\ te/xnh makrh/\n"
    uni = "Ὁ βίος βραχύς ἡ δὲ τέχνη μακρή\n"
    (testpath/"test.beta").write beta
    (testpath/"test.txt").write uni
    assert_equal beta, shell_output("#{bin/"uni2beta"} -i #{testpath/"test.txt"}")
    assert_equal uni, shell_output("#{bin/"beta2uni"} -i #{testpath/"test.beta"}")
  end
end
