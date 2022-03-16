class Melody < Formula
  desc "Readable and maintainable language that compiles to regular expressions"
  homepage "https://github.com/yoav-lavi/melody"
  url "https://github.com/yoav-lavi/melody/archive/refs/tags/melody_cli-v0.13.5.tar.gz"
  sha256 "bc1e78b49a7654da6548ace3a288662325bbbf4ef160a1250cec13cc39d4e79b"
  license "MIT"
  head "https://github.com/yoav-lavi/melody.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/melody_cli")
  end

  test do
    # Example taken from the project README
    testfile = testpath/"test.mdy"
    testfile.write <<~EOS
      16 of "na";

      2 of match {
        <space>;
        "batman";
      }

      // 🦇🦸‍♂️
    EOS
    assert_equal "(?:na){16}(?:\\sbatman){2}", shell_output("#{bin/"melody"} #{testfile}").strip
  end
end
