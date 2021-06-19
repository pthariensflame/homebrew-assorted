class Abella < Formula
  desc "Interactive theorem prover based on lambda-tree syntax"
  homepage "https://abella-prover.org/"
  head "https://github.com/abella-prover/abella.git"

  stable do
    url "https://github.com/abella-prover/abella/archive/v2.0.7.tar.gz"
    sha256 "fde3a279b3051e0aeeaedad21cf96064edf19a6c413949b2033b305d92dddd87"
  end

  depends_on "ocaml-findlib" => :build
  depends_on "ocamlbuild" => :build
  depends_on "ocaml"

  def install
    system "make", "all"
    bin.install "abella"
    pkgshare.install "examples"
    doc.install "README.md", "CHANGES", "LICENSE"
  end

  test do
    # using the provided "subst" example
    cd pkgshare/"examples/misc" do
      cp %w[subst.sig subst.mod subst.thm], testpath
    end
    system bin/"abella", testpath/"subst.thm", "-c", testpath/"subst.thc", "-o", testpath/"subst.out"
    assert_predicate testpath/"subst.thc", :exist?
    assert_predicate testpath/"subst.out", :exist?
  end
end
