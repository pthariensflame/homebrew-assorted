cask "azul-mission-control" do
  arch arm:   "aarch64",
       intel: "x64"

  version "9.1.1.1.41"
  sha256 arm:   "3dc721d06b347f77df38368d2d1e22bdf32395cfbf47fd94226ade2802031bc5",
         intel: "255162176eaf785bb4d922da967a528b6557392f9ca8dd5d7ebb56c5b615d7ed"

  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_#{arch}.tar.gz"
  name "Azul Mission Control"
  desc "Azul version of JDK Mission Control; monitor running JVMs"
  homepage "https://www.azul.com/products/components/azul-mission-control/"

  depends_on macos: ">= :monterey"

  app "zmc#{version}-ca-macos_#{arch}/Azul Mission Control.app"
end
