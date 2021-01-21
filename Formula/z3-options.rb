class Z3Options < Formula
  desc "High-performance theorem prover (with all binding options)"
  homepage "https://github.com/Z3Prover/z3"
  url "https://github.com/Z3Prover/z3/archive/z3-4.8.10.tar.gz"
  sha256 "12cce6392b613d3133909ce7f93985d2470f0d00138837de06cf7eb2992886b4"
  license "MIT"
  head "https://github.com/Z3Prover/z3.git"
  bottle :unneeded

  deprecated_option "with-java" => "with-openjdk@8"

  depends_on "dotnet" => :optional
  depends_on "mono" => :optional
  depends_on "ocaml" => :optional
  depends_on "openjdk" => :optional
  depends_on "openjdk@11" => :optional
  depends_on "openjdk@8" => :optional
  depends_on "python" => :optional

  conflicts_with "z3", because: "this is an alternate form of another formula"

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

    dotnet_versions = [
      (build.with? "dotnet"),
      (build.with? "mono"),
    ]
    odie "cannot use more than one .NET binding" if dotnet_versions.count(true) > 1
    if build.with? "dotnet"
      args << "--dotnet"
    elsif build.with? "mono"
      ENV["CSC"] = Formula["mono"].bin/"csc"
      ENV["GACUTIL"] = Formula["mono"].bin/"gacutil"
      args << "--dotnet"
    end

    java_versions = [
      (build.with? "openjdk"),
      (build.with? "openjdk@11"),
      (build.with? "openjdk@8"),
    ]
    odie "cannot use more than one Java binding" if java_versions.count(true) > 1
    args << "--java" if java_versions.any?

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
