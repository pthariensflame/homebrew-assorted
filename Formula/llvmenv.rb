class Llvmenv < Formula
  desc "Manages multiple LLVM/Clang builds"
  homepage "https://github.com/termoshtt/llvmenv"
  url "https://github.com/termoshtt/llvmenv/archive/0.3.0.tar.gz"
  sha256 "decf49ef354fa6567a439a0ac6e043777910aa0dda59f49c9f0aaa6f4fb9c7d5"
  head "https://github.com/termoshtt/llvmenv.git"


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
