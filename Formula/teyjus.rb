class Teyjus < Formula
  desc "Flagship implementation of λProlog"
  homepage "http://teyjus.cs.umn.edu"
  license "GPL-3.0-only"
  head "https://github.com/teyjus/teyjus.git"

  depends_on "ocaml" => :build
  depends_on "omake" => :build
  uses_from_macos "bison" => :build
  uses_from_macos "flex" => :build

  def install
    system "omake", "all", "-j", ENV.make_jobs
    mkdir_p bin
    cp "tjcc", bin
    cp "tjlink", bin
    cp "tjsim", bin
    cp "tjdepend", bin
    cp "tjdis", bin
    mkdir_p libexec
    cp_r "lyacc", libexec
    (bin/"lyacc").write_env_script libexec/"lyacc/lyacc",
                                   "TJPATH" => libexec/"lyacc"
    cd "emacs" do
      elisp.install Dir["*.el"]
    end
    doc.install "examples"
  end

  test do
    system "tjcc", "--version"
  end
end
