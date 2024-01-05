cask "azul-mission-control" do
  arch arm:   "aarch64",
       intel: "x64"

  version "8.3.1.81"
  sha256 arm:   "3102b409be796554c6c507c83758a97e5d9124e5de8a1933dc2619060d1de9c1",
         intel: "6d4e8532adc5d9af311e4d623c39d13b5d547dc4f7e7156fd27c206acc194707"

  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_#{arch}.tar.gz"
  name "Azul Mission Control"
  desc "Azul version of JDK Mission Control; monitor running JVMs"
  homepage "https://www.azul.com/products/components/azul-mission-control/"

  app "zmc#{version}-ca-macos_#{arch}/Azul Mission Control.app"
end
