class Olden < Formula
  desc "Utility for producing archaic English letters with Unicode"
  homepage "https://unifoundry.com/olden/index.html"
  url "https://unifoundry.com/pub/olden/olden-1.1/olden-1.1.tar.gz"
  sha256 "abb015bad1b667cdfd25bbd7901b250e6585d310432c8bf4fab56300e418f55a"
  license "GPL-2.0-or-later"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make"
    system "make", "check"
    system "make", "install"
    system "make", "clean"
  end

  test do
    assert_predicate bin/"olden", :exist?
  end
end
