cask "azul-mission-control" do
  arch arm:   "aarch64",
       intel: "x64"

  version "9.1.1.35"
  sha256 arm:   "8610486e65d187afb7d154d1950f2ce667dbc2f6d5eb6a4962368999ad382a5a",
         intel: "9fc245aa2cb2d0fe74b76d0d957ec4527a9dbe3ce95bf760fba76089f3b14cbf"

  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_#{arch}.tar.gz"
  name "Azul Mission Control"
  desc "Azul version of JDK Mission Control; monitor running JVMs"
  homepage "https://www.azul.com/products/components/azul-mission-control/"

  app "zmc#{version}-ca-macos_#{arch}/Azul Mission Control.app"
end
