class Kshdb < Formula
  desc "Korn shell debugger"
  homepage "https://kshdb.readthedocs.io/en/latest/"
  url "https://github.com/rocky/kshdb/archive/1.1.0.tar.gz"
  sha256 "bfc4026e80c9f55719af6d5d51349be422292da828a8190ef86260ca8ac390c3"
  license "GPL-2.0-only"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "ksh93"

  def install
    system "autoreconf", "-i"
    system "autoconf"
    system "./configure",
           "--disable-silent-rules",
           "--prefix=#{prefix}",
           "--with-ksh=#{Formula["ksh"].bin/"ksh"}"
    system "make", "install"
  end

  test do
    system "kshdb", "-V"
  end
end
