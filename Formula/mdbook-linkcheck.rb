class MdbookLinkcheck < Formula
  desc "Link-checker plugin for mdbook"
  homepage "https://github.com/Michael-F-Bryan/mdbook-linkcheck"
  url "https://github.com/Michael-F-Bryan/mdbook-linkcheck/archive/v0.7.6.tar.gz"
  sha256 "c26ea7841f41fba078c6c358a5733026fa4927421dcec2f6ef260c17abecbd9a"
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
