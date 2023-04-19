class VulkanscPcutil < Formula
  desc "Vulkan SC Pipeline Cache Utility"
  homepage "https://github.com/KhronosGroup/VulkanSC-pcutil"
  license "Apache-2.0"
  head "https://github.com/KhronosGroup/VulkanSC-pcutil.git", branch: "main"

  def install
    system "make", "all"
    bin.install ["ptest", "pcinfo"]
    include.install ["pcreader.hpp", "pcwriter.hpp", "fake"]
  end

  test do
    system bin/"ptest"
  end
end
