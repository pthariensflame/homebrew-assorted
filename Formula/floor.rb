class Floor < Formula
  desc "Library/toolchain for same-source CPU/GPU C++ programming/execution"
  homepage "https://github.com/a2flo/floor"
  license "GPL-2.0-only"
  head "https://github.com/a2flo/floor.git", branch: "master"

  depends_on "llvm" => [:build, :test]
  depends_on "sdl2"
  depends_on "openal-soft"

  def install
    ENV["CC"] = Formula["llvm"].bin/"clang"
    ENV["CXX"] = Formula["llvm"].bin/"clang++"
    ENV["CFLAGS"] = "-I#{Formula["sdl2"].include}"
    ENV["CXXFLAGS"] = "-I#{Formula["sdl2"].include}"
    ENV["LDFLAGS"] = "-L#{Formula["sdl2"].lib} -lsdl2"
    files = Dir["*"]
    mkdir "floor_tmp"
    for file in files do
      mv file, "floor_tmp/"
    end
    mv "floor_tmp", "floor"
    cd "floor" do
      system "./build.sh", "-v", "opt", "native"
      lib.install "bin"
    end
    include.install "floor"
  end

  test do
    system "false"
  end
end
