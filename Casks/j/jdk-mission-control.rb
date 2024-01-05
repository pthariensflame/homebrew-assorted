cask "jdk-mission-control" do
  version "8.1.0,07"
  sha256 "6719d9e9e22e3d456994e398c47b280090c2eff58dc4cb69f8b3d45713dfc29c"

  url "https://download.java.net/java/GA/jmc#{version.major}/#{version.csv.second}/binaries/jmc-#{version.csv.first}_osx-x64.tar.gz"
  name "JDK Mission Control"
  desc "Monitor running JVMs"
  homepage "https://openjdk.java.net/projects/jmc/"

  app "jmc-#{version.major}+#{version.minor}_osx-x64_bin/JDK Mission Control.app"
end
