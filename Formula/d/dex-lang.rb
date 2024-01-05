class DexLang < Formula
  desc "Research language for array processing in the Haskell/ML family"
  homepage "https://github.com/google-research/dex-lang"
  license "BSD-3-Clause"
  head "https://github.com/google-research/dex-lang.git", branch: "main"

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build
  depends_on "libpng"
  depends_on "llvm"

  def install
    system "cabal", "update"
    ENV["PREFIX"] = prefix
    system "make", "install"
    system "make", "doc"
    cp_r "doc", doc
  end

  test do
    system bin/"dex", "help"
  end
end
