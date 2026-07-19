cask "azul-mission-control" do
  arch arm:   "aarch64",
       intel: "x64"

  version "9.1.2.47"
  sha256 arm:   "e98d619ecdbbafeabcb3dc895cd9aac6522888569957ef09f96ef34d956fa0cf",
         intel: "d195f58a90df8ebbc4a6c90c30986226392b76d65dc8cd7404bd2eb60bfddb47"

  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_#{arch}.tar.gz"
  name "Azul Mission Control"
  desc "Azul version of JDK Mission Control; monitor running JVMs"
  homepage "https://www.azul.com/products/components/azul-mission-control/"

  depends_on macos: :big_sur

  app "zmc#{version}-ca-macos_#{arch}/Azul Mission Control.app"
end
