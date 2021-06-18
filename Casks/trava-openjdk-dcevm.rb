cask "trava-openjdk-dcevm" do
  version "11.0.11+1"
  sha256 "efec9c39405fd09a56fc0b0f855b522ea00f35e39639307a4848a3a23f985a66"

  url "https://github.com/TravaOpenJDK/trava-jdk-#{version.major}-dcevm/releases/download/dcevm-#{version}/Openjdk#{version.major}u-dcevm-mac-x64.tar.gz"
  name "TravaOpenJDK DCEVM"
  desc "Version of Java with unlimited runtime class and resource redefinition"
  homepage "https://github.com/TravaOpenJDK/trava-jdk-#{version.major}-dcevm"

  artifact "dcevm-#{version}", target: "/Library/Java/JavaVirtualMachines/trava-openjdk-dcevm-#{version.major}.jdk"
end
