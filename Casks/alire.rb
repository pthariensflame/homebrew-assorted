cask "alire" do
  version "1.2.0"
  sha256 "a705195041bc9ccad61e4f580024507de919c327407d2ccc0603fa79b8aeb246"

  url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-macos.zip",
      verified: "github.com/alire-project"
  name "Alire"
  desc "Obtain, build, and incorporate Ada/SPARK libraries into your own projects"
  homepage "https://alire.ada.dev/"

  binary "bin/alr"

  zap trash: ["~/.config/alire"]
end
