cask "jdk-mission-control" do
  version "7.1.2,04"
  sha256 "ca58d200ee8a350fcc3f5c8ffe7b9b51dd8a9372de106a0ebff11f748647f986"

  url "https://download.java.net/java/GA/jmc#{version.major}/#{version.after_comma}/binaries/jmc-#{version.before_comma}_osx-x64.tar.gz"
  name "JDK Mission Control"
  desc "Monitor running JVMs"
  homepage "https://openjdk.java.net/projects/jmc/"

  app "jmc-#{version.major}+#{version.minor}_osx-x64_bin/JDK Mission Control.app"
end
