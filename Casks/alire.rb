cask "alire" do
  version "1.1.1"
  sha256 "621a28b0cba4cd86efd42a7b10308515b5fbb8103e489c8876f96bcf4f715282"

  url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-x86_64-macos.zip",
      verified: "github.com/alire-project"
  name "Alire"
  desc "Obtain, build, and incorporate Ada/SPARK libraries into your own projects"
  homepage "https://alire.ada.dev/"

  binary "bin/alr"

  zap trash: ['~/.config/alire']
end
