cask 'zulu-mission-control' do
  version '7.1.0.69'
  sha256 '3bb672917f6b80f451099cf7d5d97f4daafc4e79850ff29d1193a7413e922307'

  depends_on
  
  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_x64.tar.gz"
  name 'Zulu Mission Control'
  homepage 'https://www.azul.com/products/zulu-mission-control/'

  app "zmc#{version}-ca-macos_x64/Zulu Mission Control.app"
end
