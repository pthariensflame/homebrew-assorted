class Llvmenv < Formula
  desc "Manages multiple LLVM/Clang builds"
  homepage "https://github.com/termoshtt/llvmenv"
  url "https://github.com/termoshtt/llvmenv/archive/0.2.1.tar.gz"
  sha256 "4f51b00a08f8ccf497bc247fc0315e23f22bc313efd5bf69d2d3407750804864"
  head "https://github.com/termoshtt/llvmenv.git"

  devel do
    url "https://github.com/termoshtt/llvmenv/archive/0.2.2-alpha.1.tar.gz"
    sha256 "4f51b00a08f8ccf497bc247fc0315e23f22bc313efd5bf69d2d3407750804864"
  end

  depends_on "rust" => :build
  depends_on "cmake"

  def caveats
    <<~EOS
      If this is your first time using llvmenv, youll need to run `llvmenv init` to generate the default configuration file.
      You can then edit it with `llvmenv edit`.
    EOS
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system bin/"llvmenv", "--version"
  end
end
