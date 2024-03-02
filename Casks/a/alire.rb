cask "alire" do
  version "1.2.2"
  sha256 "7e568dfa8d9a785ef614086a1ab64d1a6853581c574ee661cffc8b558fd0bfaa"

  url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-macos.zip",
      verified: "github.com/alire-project/"
  name "Alire"
  desc "Obtain, build, and incorporate Ada/SPARK libraries into your own projects"
  homepage "https://alire.ada.dev/"

  binary "bin/alr"

  zap trash: "~/.config/alire"
end
