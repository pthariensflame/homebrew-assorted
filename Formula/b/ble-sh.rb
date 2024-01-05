# typed: true
# frozen_string_literal: true

class BleSh < Formula
  desc "Bash Line Editor: syntax highlighting, auto suggestions, vim modes, etc."
  homepage "https://github.com/akinomyoga/ble.sh"
  url "https://github.com/akinomyoga/ble.sh.git",
      tag:      "v0.4.0-devel3",
      revision: "1a5c451c8baa71439a6be4ea0f92750de35a7620"
  version "0.4.0-devel3"
  license "BSD-3-Clause"
  head "https://github.com/akinomyoga/ble.sh.git",
       branch: "master"

  depends_on "gawk" => :build
  depends_on "make" => :build

  uses_from_macos "bash"

  def install
    system Formula["make"].bin/"gmake"
    system Formula["make"].bin/"gmake", "INSDIR=#{libexec/"ble"}", "install"
  end

  def caveats
    <<~EOS
      To enable ble.sh by default, add the following to the beginning of your ~/.bash_profile:
        [[ $- == *i* ]] && source #{opt_libexec/"ble/ble.sh"} --noattach
      and also add the following to the end of your ~/.bash_profile:
        ((_ble_bash)) && ble-attach

      We highly recommend using a more up-to-date version of bash than the one macOS comes with by default.  You can install that with:
        brew install bash
    EOS
  end

  test do
    # This software is impossible to test in an automated fashion;
    # the best we can do is test that it did in fact create the top-level script.
    assert_predicate libexec/"ble/ble.sh", :exist?
  end
end
