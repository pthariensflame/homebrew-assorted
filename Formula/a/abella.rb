class Abella < Formula
  desc "Interactive theorem prover based on lambda-tree syntax"
  homepage "https://abella-prover.org/"
  url "https://github.com/abella-prover/abella.git",
      tag:      "v2.0.8.3",
      revision: "e59565233045865942882271a34236c257edc8e1"
  head "https://github.com/abella-prover/abella.git",
       branch: "master"

  depends_on "dune" => :build
  depends_on "menhir" => :build
  depends_on "ocaml" => :build

  resource "base64" do
    url "https://github.com/mirage/ocaml-base64.git",
        tag:      "v3.5.1",
        revision: "084346f14ed1e6706d733402dd6ff65b0dc4f718"
  end

  resource "cmdliner" do
    url "https://erratique.ch/software/cmdliner/releases/cmdliner-1.3.0.tbz"
    sha256 "8e8180f573b440f6a7a8c208dab2cae4a82384fec732d22784d1bb6e64168cbb"
  end

  resource "re" do
    url "https://github.com/ocaml/ocaml-re.git",
        tag:      "1.13.2",
        revision: "f596237c675e1e3b17a1ffea72febc6e27630f29"
  end

  resource "seq" do
    url "https://github.com/c-cube/seq.git",
        tag:      "v0.3.1",
        revision: "f715de692d602df65ae452a5a745c32d25adebdc"
  end

  resource "yojson" do
    url "https://github.com/ocaml-community/yojson.git",
        tag:      "2.2.2",
        revision: "3f82b79d1865eec82c6f498ee1835a90c74c31b4"
  end

  def install
    resource("base64").stage "base64"
    resource("cmdliner").stage "cmdliner"
    resource("seq").stage "seq"
    resource("re").stage "re"
    resource("yojson").stage "yojson"

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
    assert_path_exists testpath/"subst.thc"
    assert_path_exists testpath/"subst.out"
  end
end
