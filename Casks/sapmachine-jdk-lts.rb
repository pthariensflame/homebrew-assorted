cask 'sapmachine-jdk-lts' do
  version '11.0.7'
  sha256 '2a69888af8eb313fd91145eeea595cd6a3f9409d0a9ed9856ad74aa85268b9d0'

  # github.com/SAP/SapMachine was verified as official when first introduced to the cask
  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name 'SapMachine OpenJDK Development Kit, LTS release'
  homepage 'https://sapmachine.io/'

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-jdk-#{version}.jdk"
end
