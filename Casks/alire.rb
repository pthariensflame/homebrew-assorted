cask "alire" do
  version "1.2.1"
  sha256 "d0a1fe59b7afb71c0707b96d9390332ba6bc3a4b4aca442e9918da5d75f42fa1"

  url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-macos.zip",
      verified: "github.com/alire-project"
  name "Alire"
  desc "Obtain, build, and incorporate Ada/SPARK libraries into your own projects"
  homepage "https://alire.ada.dev/"

  binary "bin/alr"

  zap trash: ["~/.config/alire"]
end
