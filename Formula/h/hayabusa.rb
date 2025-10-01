class Hayabusa < Formula
  desc "Fast Rust fetch program"
  homepage "https://github.com/Notarin/hayabusa"
  url "https://github.com/Notarin/hayabusa/archive/refs/tags/v0.3.9.tar.gz"
  sha256 "56d237a157c75bae7af4920035213a3a47c69f7c5433a4016e73f90bdf00d96c"
  license "AGPL-3.0-or-later"
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
