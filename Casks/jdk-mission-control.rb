cask "jdk-mission-control" do
  version "7.1.2b04"
  sha256 "ca58d200ee8a350fcc3f5c8ffe7b9b51dd8a9372de106a0ebff11f748647f986"

  ver_num, ver_build = version.split "b"

  url "https://download.java.net/java/GA/jmc7/#{ver_build}/binaries/jmc-#{ver_num}_osx-x64.tar.gz"
  name "JDK Mission Control"
  desc "Monitor running JVMs"
  homepage "https://openjdk.java.net/projects/jmc/"

  app "jmc-#{version.major}+#{version.minor}_osx-x64_bin/JDK Mission Control.app"
end
