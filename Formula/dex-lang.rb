class DexLang < Formula
  desc "Research language for array processing in the Haskell/ML family"
  homepage "https://github.com/google-research/dex-lang"
  license "BSD-3-Clause"
  head "https://github.com/google-research/dex-lang.git", branch: "main"

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build
  depends_on "libpng"
  depends_on "llvm@9"

  def install
    inreplace "makefile", "\tclang++", "\t#{Formula["llvm@9"].bin/"clang++"}"
    inreplace "makefile",
              "--flag dex:optimized",
              "--constraint \"dex +optimized\" -O2 "\
              "--constraint \"llvm-hs -shared-llvm\" "\
              "--with-gcc=#{Formula["llvm@9"].bin/"clang"}"
    inreplace "makefile", "--local-bin-path", "--install-method copy --prefix #{prefix} --installdir"
    inreplace "src/resources/Resources.hs", "embedFile \"", "embedFile \"#{buildpath}/"
    system "cabal", "update"
    ENV["PREFIX"] = prefix
    ENV["CXXFLAGS"] = "-std=gnu++17" # ???
    system "make", "install"
    system "make", "doc"
    cp_r "doc", doc
  end

  test do
    # system "make", "test"
  end
end
