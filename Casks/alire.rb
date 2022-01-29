cask "alire" do
  version "1.1.2"
  sha256 "d29ea8eeb8ac56367175f6c34e49474b6909f9f5589b978bd6f53e95b0d5224e"

  url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-macos.zip",
      verified: "github.com/alire-project"
  name "Alire"
  desc "Obtain, build, and incorporate Ada/SPARK libraries into your own projects"
  homepage "https://alire.ada.dev/"

  binary "bin/alr"

  zap trash: ["~/.config/alire"]
end
