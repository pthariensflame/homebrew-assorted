cask "azul-mission-control" do
  arch arm:   "aarch64",
       intel: "x64"

  version "9.1.0.25"
  sha256 arm:   "e9f4b39a52931bf0d5367fbbee6af96b098437b5287020d2c09915414bd5bd14",
         intel: "7188d2560be861783b305f5459e0faddec41399e3c5dd3748290834defad2741"

  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_#{arch}.tar.gz"
  name "Azul Mission Control"
  desc "Azul version of JDK Mission Control; monitor running JVMs"
  homepage "https://www.azul.com/products/components/azul-mission-control/"

  app "zmc#{version}-ca-macos_#{arch}/Azul Mission Control.app"
end
