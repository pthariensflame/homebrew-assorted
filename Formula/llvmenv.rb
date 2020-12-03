class Llvmenv < Formula
  desc "Manages multiple LLVM/Clang builds"
  homepage "https://github.com/llvmenv/llvmenv"
  url "https://github.com/llvmenv/llvmenv/archive/v0.3.1.tar.gz"
  sha256 "56ea5278db339f0f8d8cdf07fb3cf86b33a2b7343df54967d12b886bed8390d0"
  head "https://github.com/llvmenv/llvmenv.git"


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
