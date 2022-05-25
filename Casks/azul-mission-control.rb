cask "azul-mission-control" do
  version "8.1.1.51"
  sha256 "c147c4c0a06745b4dfb6a5e89313908eed2add5cbdd0f77a12c06b7726329573"

  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_x64.tar.gz"
  name "Azul Mission Control"
  desc "Azul version of JDK Mission Control; monitor running JVMs"
  homepage "https://www.azul.com/products/components/zulu-mission-control/"

  app "zmc#{version}-ca-macos_x64/Azul Mission Control.app"
end
