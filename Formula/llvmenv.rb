class Llvmenv < Formula
  desc "Manages multiple LLVM/Clang builds"
  homepage "https://github.com/llvmenv/llvmenv"
  url "https://github.com/llvmenv/llvmenv/archive/v0.3.2.tar.gz"
  sha256 "b0fc96e1c07113f691d618021b4ec1aba7ebafa4f8c9221e45e8ae1dc7688c79"
  head "https://github.com/llvmenv/llvmenv.git"

  depends_on "rust" => :build
  depends_on "cmake"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  def caveats
    <<~EOS
      If this is your first time using llvmenv, youll need to run `llvmenv init` to generate the default configuration file.
      You can then edit it with `llvmenv edit`.
    EOS
  end

  test do
    system bin/"llvmenv", "--version"
  end
end
