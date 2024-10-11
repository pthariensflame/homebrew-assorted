cask "alire" do
  arch intel: "x86_64",
       arm:   "aarch64"

  version "2.0.2"
  sha256 intel: "d148a8efc9144b4c2f7340c272cada2c220d852ee69a07e98a5b64c4d33bd1f4",
         arm:   "fc9eb1b2658f0dd82c73fb1980e7f2cb0e500f0846cea505b6f6231358b441ef"

  url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-#{arch}-macos.zip",
      verified: "github.com/alire-project/"
  name "Alire"
  desc "Obtain, build, and incorporate Ada/SPARK libraries into your own projects"
  homepage "https://alire.ada.dev/"

  binary "bin/alr"

  zap trash: "~/.config/alire"
end
