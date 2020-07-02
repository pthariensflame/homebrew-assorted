cask 'zulu-mission-control' do
  version '7.1.1.77'
  sha256 '5cf03c6fe9aae76a48ab8d4ac2489a44510154558d1ba743aeb130f4b471123f'

  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_x64.tar.gz"
  name 'Zulu Mission Control'
  homepage 'https://www.azul.com/products/zulu-mission-control/'

  depends_on java: '1.8+'

  app "zmc#{version}-ca-macos_x64/Zulu Mission Control.app"
end
