class MdbookLinkcheck < Formula
  desc "Link-checker plugin for mdbook"
  homepage "https://github.com/Michael-F-Bryan/mdbook-linkcheck"
  url "https://github.com/Michael-F-Bryan/mdbook-linkcheck/archive/v0.7.1.tar.gz"
  sha256 "349a168f7838d590163f9e03f522ae1a68f5a1eb7d6a78c24a9e8c437a05e50f"
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
