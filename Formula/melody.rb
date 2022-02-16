class Melody < Formula
  desc "Readable and maintainable language that compiles to regular expressions"
  homepage "https://github.com/yoav-lavi/melody"
  license "MIT"
  head "https://github.com/yoav-lavi/melody.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
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
