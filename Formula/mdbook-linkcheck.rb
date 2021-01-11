class MdbookLinkcheck < Formula
  desc "Link-checker plugin for mdbook"
  homepage "https://github.com/Michael-F-Bryan/mdbook-linkcheck"
  url "https://github.com/Michael-F-Bryan/mdbook-linkcheck/archive/v0.7.2.tar.gz"
  sha256 "ca9ec8cee58c1ae9ed5169da285e3254214026396351acc857f6ecb7a4186f29"
  head "https://github.com/Michael-F-Bryan/mdbook-linkcheck.git"

  depends_on "rust" => :build
  depends_on "mdbook"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"mdbook-linkcheck", "-V"
  end
end
