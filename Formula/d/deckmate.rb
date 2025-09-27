class Deckmate < Formula
  desc "Utility for pretty-printing fixed-format punched card decks"
  homepage "https://unifoundry.com/deckmate/index.html"
  url "https://unifoundry.com/pub/deckmate/deckmate-1.2/deckmate-1.2.tar.gz"
  sha256 "d0f87007272eb8e025a7f38d25eaff4660b52347bb7a205e9502d5e63b8fb44b"
  license "GPL-2.0-or-later"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make"
    system "make", "check"
    system "make", "install"
    system "make", "clean"
    system "make", "installcheck"
  end

  test do
    assert_path_exists bin/"deckmate"
  end
end
