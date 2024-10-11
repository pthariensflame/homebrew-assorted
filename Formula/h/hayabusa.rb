class Hayabusa < Formula
  desc "Fast Rust fetch program"
  homepage "https://github.com/Notarin/hayabusa"
  url "https://github.com/Notarin/hayabusa/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "bb584c07b9dd899b92a14b4100062af09255f3146bb3fdf38339c99f9527621c"
  license "CC-BY-NC-ND-4.0"
  head "https://github.com/Notarin/hayabusa.git", branch: "main"

  depends_on "rust" => :build
  depends_on "openssl"

  def install
    system "cargo", "install", *std_cargo_args
  end

  service do
    run [opt_bin/"hayabusa", "--daemon"]
    keep_alive true
    working_dir var
    log_path var/"log/hayabusa.log"
    error_log_path var/"log/hayabusa.log"
  end

  test do
    fork do
      exec bin/"hayabusa", "--daemon"
    end
    sleep 2
    assert_match "Execution time:", shell_output("#{bin}/hayabusa --benchmark")
  end
end
