class Hayabusa < Formula
  desc "Fast Rust fetch program"
  homepage "https://github.com/Notarin/hayabusa"
  url "https://github.com/Notarin/hayabusa/archive/refs/tags/v0.3.6.tar.gz"
  sha256 "b7a432c12e087e955aefeac88007e2392a11b126d5b36a4d4888bc3d94338e42"
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
