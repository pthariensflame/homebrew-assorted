class Abella < Formula
  desc "Interactive theorem prover based on lambda-tree syntax"
  homepage "https://abella-prover.org/"
  head "https://github.com/abella-prover/abella.git"

  stable do
    url "https://github.com/abella-prover/abella/archive/v2.0.7.tar.gz"
    sha256 "fde3a279b3051e0aeeaedad21cf96064edf19a6c413949b2033b305d92dddd87"

    # Necessary in order to compile with Homebrew's packaged ocaml version.
    # See: abella-prover/abella#123
    patch do
      url "https://github.com/abella-prover/abella/commit/101faf5553ba1267c0e4c1dda979372b0c38a676.patch?full_index=1"
      sha256 "2f00562b177f1b131dec794fea769153ce767c6e8fd249c159c2a12a9012061a"
    end
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
