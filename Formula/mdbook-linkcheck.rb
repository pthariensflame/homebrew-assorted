class MdbookLinkcheck < Formula
  desc "Link-checker plugin for mdbook"
  homepage "https://github.com/Michael-F-Bryan/mdbook-linkcheck"
  url "https://github.com/Michael-F-Bryan/mdbook-linkcheck/archive/v0.7.0.tar.gz"
  sha256 "e3e444690d4e2c744eb240d4f6bacc6ebfacfadd9f75c61e0c461d7f046b920e"
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
