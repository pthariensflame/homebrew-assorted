class Z3Options < Formula
  desc "High-performance theorem prover (with all binding options)"
  homepage "https://github.com/Z3Prover/z3"
  url "https://github.com/Z3Prover/z3/archive/z3-4.8.9.tar.gz"
  sha256 "c9fd04b9b33be74fffaac3ec2bc2c320d1a4cc32e395203c55126b12a14ff3f4"
  license "MIT"
  head "https://github.com/Z3Prover/z3.git"
  bottle :unneeded

  depends_on :java => ["1.8", :optional]
  depends_on "mono" => :optional
  depends_on "ocaml" => :optional
  depends_on "python" => :optional

  conflicts_with "z3", :because => "this is an alternate form of another formula"

  # This formula is for people who will compile with their chosen options

  def install
    args = %W[
      scripts/mk_make.py
      --prefix=#{prefix}
      --staticlib
    ]
    
    if build.with? "python"
      pycmd = "python3"
      xy = Language::Python.major_minor_version "python3"
      args << "--python"
      args << "--pypkgdir=#{lib}/python#{xy}/site-packages"
    else
      pycmd = "python"
    end
    if build.with? "mono"
      ENV["CSC"] = Formula["mono"].bin/"csc"
      ENV["GACUTIL"] = Formula["mono"].bin/"gacutil"
      args << "--dotnet"
    end
    args << "--java" if build.with? "java"
    args << "--ml" if build.with? "ocaml"
    
    system pycmd, *args

    cd "build" do
      system "make"
      system "make", "install"
    end

    system "make", "-C", "contrib/qprofdiff"
    bin.install "contrib/qprofdiff/qprofdiff"

    pkgshare.install "examples"
  end

  test do
    system ENV.cc, "-I#{include}", "-L#{lib}", "-lz3",
           pkgshare/"examples/c/test_capi.c", "-o", testpath/"test"
    system "./test"
  end
end
