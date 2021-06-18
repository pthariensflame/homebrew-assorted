cask "azul-mission-control" do
  version "8.0.0.17"
  sha256 "111cbbd9c6fe97095985edbaef0874f26e0417a3746b608310699d6e64cac211"

  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_x64.tar.gz"
  name "Zulu Mission Control"
  desc "Azul version of JDK Mission Control; monitor running JVMs"
  homepage "https://www.azul.com/products/components/zulu-mission-control/"

  app "zmc#{version}-ca-macos_x64/Zulu Mission Control.app"
end
