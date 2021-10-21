cask "azul-mission-control" do
  version "8.1.0.42"
  sha256 "2ec100e47eb71e4b29a8a42d6d99521374bf00a83312cc965f037930f83cdee7"

  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_x64.tar.gz"
  name "Zulu Mission Control"
  desc "Azul version of JDK Mission Control; monitor running JVMs"
  homepage "https://www.azul.com/products/components/zulu-mission-control/"

  app "zmc#{version}-ca-macos_x64/Zulu Mission Control.app"
end
