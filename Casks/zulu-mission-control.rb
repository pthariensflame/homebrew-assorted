cask 'zulu-mission-control' do
  version '7.1.0.65'
  sha256 '40b8208fd8b97e66f0f0c0fd93d5e8f608c4461d1d26729509e393cc7a7cbd8c'

  depends_on
  
  url "https://cdn.azul.com/zmc/bin/zmc#{version}-ca-macos_x64.tar.gz"
  name 'Zulu Mission Control'
  homepage 'https://www.azul.com/products/zulu-mission-control/'

  app 'zmc#{version}-ca-macos_x64/Zulu Mission Control.app'
end
