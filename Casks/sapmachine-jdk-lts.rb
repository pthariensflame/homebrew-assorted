cask "sapmachine-jdk-lts" do
  version "11.0.8"
  sha256 "15829218eb47303b74eaecbc28d307c10123d841e67fe9701a904cd45365dc2d"

  # github.com/SAP/SapMachine was verified as official when first introduced to the cask
  url "https://github.com/SAP/SapMachine/releases/download/sapmachine-#{version}/sapmachine-jdk-#{version}_osx-x64_bin.dmg"
  appcast "https://sap.github.io/SapMachine/latest/#{version.major}"
  name "SapMachine OpenJDK Development Kit, LTS release"
  desc "SAP-supported build of OpenJDK LTS"
  homepage "https://sapmachine.io/"

  artifact "sapmachine-jdk-#{version}.jdk", target: "/Library/Java/JavaVirtualMachines/sapmachine-jdk-#{version}.jdk"
end
