class Openvadl < Formula
  desc "Open-source implementation of the VADL processor description language"
  homepage "https://openvadl.org"
  url "https://github.com/OpenVADL/openvadl/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "b3c92a4c5ebce9c44dcb7f78c9aca6b126df535915d393e3c5e13bd74d0522ed"
  license all_of: ["GPL-3.0-or-later", "Apache-2.0", "CC-BY-4.0"]
  head "https://github.com/OpenVADL/openvadl.git", branch: "master"

  depends_on "openjdk@25"

  def install
    system "./gradlew", "--no-daemon", "installDist"
    libexec.install Dir["vadl-cli/build/install/openvadl/*"]
    bin.install_symlink libexec/"bin/openvadl"
  end

  test do
    system bin/"openvadl", "-V"
  end
end
