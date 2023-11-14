class Abella < Formula
  desc "Interactive theorem prover based on lambda-tree syntax"
  homepage "https://abella-prover.org/"
  url "https://github.com/abella-prover/abella.git",
      tag:      "v2.0.8",
      revision: "ddfb615d501ad660510a4fe512b344f46cda6317"
  head "https://github.com/abella-prover/abella.git",
       branch: "master"

  depends_on "dune" => :build
  depends_on "menhir" => :build
  depends_on "ocaml" => :build

  resource "cmdliner" do
    url "https://erratique.ch/software/cmdliner/releases/cmdliner-1.2.0.tbz"
    sha256 "afed10589028394fd6f64e97b1c617e2be70de6d35ee47e04235da31a9dd0078"
  end

  resource "yojson" do
    url "https://github.com/ocaml-community/yojson.git",
        tag:      "2.1.1",
        revision: "57bc8ca0eaf5bdb423fcdece49ea0d1c2866f90c"
  end

  resource "cppo" do
    url "https://github.com/ocaml-community/cppo.git",
        tag:      "v1.6.9",
        revision: "31c1365214d2381b12127c657156778e921357f8"
  end

  resource "seq" do
    url "https://github.com/c-cube/seq.git",
        tag:      "v0.3.1",
        revision: "f715de692d602df65ae452a5a745c32d25adebdc"
  end

  def install
    resource("cmdliner").stage "cmdliner"
    resource("yojson").stage "yojson"
    resource("cppo").stage "cppo"
    resource("seq").stage "seq"

    system "make", "all-release"

    cd "_build/default/src" do
      bin.install "abella.exe" => "abella"
      bin.install "abella_doc.exe" => "abella_doc"
      bin.install "abella_dep.exe" => "abella_dep"
    end
    pkgshare.install "examples"
    doc.install "README.md", "CHANGES.md", "LICENSE"
  end

  test do
    # using the provided "subst" example
    cd pkgshare/"examples/misc" do
      cp %w[subst.sig subst.mod subst.thm], testpath
    end
    system bin/"abella", testpath/"subst.thm",
           "-o", testpath/"subst.out"
    assert_predicate testpath/"subst.thc", :exist?
    assert_predicate testpath/"subst.out", :exist?
  end
end
