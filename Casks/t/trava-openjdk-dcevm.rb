cask "trava-openjdk-dcevm" do
  version "11.0.15+1"
  sha256 "a527432fc2eba32d0bc61c0b2653542be251329c33c86f023ebe02bf3ec72c23"

  url "https://github.com/TravaOpenJDK/trava-jdk-#{version.major}-dcevm/releases/download/dcevm-#{version}/Openjdk#{version.major}u-dcevm-mac-x64.tar.gz"
  name "TravaOpenJDK DCEVM"
  desc "Version of Java with unlimited runtime class and resource redefinition"
  homepage "https://github.com/TravaOpenJDK/trava-jdk-#{version.major}-dcevm"

  artifact "dcevm-#{version}", target: "/Library/Java/JavaVirtualMachines/trava-openjdk-dcevm-#{version.major}.jdk"
end
