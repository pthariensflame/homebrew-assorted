class Utfcheck < Formula
  desc "Unicode UTF-8 validation utility"
  homepage "https://unifoundry.com/utfcheck/index.html"
  url "https://unifoundry.com/pub/utfcheck/utfcheck-1.2/utfcheck-1.2.tar.gz"
  sha256 "c5d5e6f6fa5d4dd1b0caa64f011d71bf5bed3f8948c2cba384e378cf3d1c0cd8"
  license "GPL-2.0-or-later"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make"
    system "make", "check"
    system "make", "install"
    system "make", "clean"
  end

  test do
    assert_path_exists bin/"utfcheck"
  end
end
