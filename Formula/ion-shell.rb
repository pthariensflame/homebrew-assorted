class IonShell < Formula
  desc "Modern system shell from RedoxOS"
  homepage "https://gitlab.redox-os.org/redox-os/ion"
  head "https://gitlab.redox-os.org/redox-os/ion.git"
  revision 1

  depends_on "coreutils" => :build
  depends_on "mdbook" => :build
  depends_on "mdbook-linkcheck" => :build
  depends_on "rust" => :build

  def install
    inreplace "Makefile", "\tinstall", "\t" + Formula["coreutils"].bin/"ginstall"

    ENV["RUSTUP"] = "0"
    ENV["TOOLCHAIN"] = Formula["rust"].version.to_s
    ENV["prefix"] = prefix.to_s

    system "make", "manual"
    system Formula["mdbook"].bin/"mdbook", "build", "-d", doc.to_s, "manual"

    system "make"
    system "make", "install"
  end

  def caveats
    <<~EOS
      You may need to alter /etc/shells to include #{opt_bin}/ion in order to use ion as a shell.
    EOS
  end

  test do
    system "ion", "--version"
  end
end
