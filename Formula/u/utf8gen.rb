class Utf8gen < Formula
  desc "Unicode UTF-8 generation utility"
  homepage "https://unifoundry.com/utf8gen/index.html"
  url "https://unifoundry.com/pub/utf8gen/utf8gen-1.1/utf8gen-1.1.tar.gz"
  sha256 "45f7d88c61cedadb8faa64c04d3609024736f728411041b8c23a617b980be962"
  license "GPL-2.0-or-later"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make"
    system "make", "check"
    system "make", "install"
    system "make", "clean"
  end

  test do
    assert_path_exists bin/"utf8gen"
  end
end
