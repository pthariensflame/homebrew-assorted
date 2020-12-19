cask "zulu-mission-control" do
  version "7.1.1.79"
  sha256 "74edc09c788e8c28bb4cfd4d8f72696e27b4e019c84b2a44816c13541e4acf80"

  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_x64.tar.gz"
  name "Zulu Mission Control"
  desc "Azul version of JDK Mission Control; monitor running JVMs"
  homepage "https://www.azul.com/products/zulu-mission-control/"

  depends_on "zulu"

  app "zmc#{version}-ca-macos_x64/Zulu Mission Control.app"
end
