cask 'jdk-mission-control' do
  version '7.14'
  sha256 '81a7754c75be718cee852f988cc64d5cb1f2aa90a3a4bbe0f8fdc70d9c719ab3'

  url "https://download.java.net/java/GA/jmc#{version.major}/#{version.minor}/jmc-#{version.major}_osx-x64_bin.tar.gz"
  name 'JDK Mission Control'
  homepage 'https://openjdk.java.net/projects/jmc/'

  app "jmc-#{version.major}+#{version.minor}_osx-x64_bin/JDK Mission Control.app"
end
