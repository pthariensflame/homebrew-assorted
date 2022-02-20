# coding: utf-8
class Melody < Formula
  desc "Readable and maintainable language that compiles to regular expressions"
  homepage "https://github.com/yoav-lavi/melody"
  url "https://github.com/yoav-lavi/melody/archive/refs/tags/melody_cli-v0.1.1.tar.gz"
  sha256 "d36bf9d1a7b73decff74cc360a45f6193895888029096f8fd4055a499fb722a6"
  license "MIT"
  revision 1
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
    assert_equal "/(?:na){16}(?:\\sbatman){2}/", shell_output("#{bin/"melody"} #{testfile}").strip
  end
end
