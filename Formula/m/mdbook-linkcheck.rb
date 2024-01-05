class MdbookLinkcheck < Formula
  desc "Link-checker plugin for mdbook"
  homepage "https://github.com/Michael-F-Bryan/mdbook-linkcheck"
  url "https://github.com/Michael-F-Bryan/mdbook-linkcheck/archive/refs/tags/v0.7.7.tar.gz"
  sha256 "3194243acf12383bd328a9440ab1ae304e9ba244d3bd7f85f1c23b0745c4847a"
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
