cask "alire" do
  version "1.1.3"
  sha256 "d39a10c729cbc0f06422d64edc37dc0f45128dba93727b10a7d4d571abac3856"

  url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-macos.zip",
      verified: "github.com/alire-project"
  name "Alire"
  desc "Obtain, build, and incorporate Ada/SPARK libraries into your own projects"
  homepage "https://alire.ada.dev/"

  binary "bin/alr"

  zap trash: ["~/.config/alire"]
end
