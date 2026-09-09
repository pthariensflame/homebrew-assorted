cask "alire" do
  arch arm: "aarch64", intel: "x86_64"

  version "2.1.0"
  sha256 arm:   "98dc104602de091a7bf823692f95c380a988ee7db929c0e00e5afa36ef2dfc0c",
         intel: "67d3389833b936a56534b7ad2ea91164b18db40318571e904fc8ab41aca7acc8"

  url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-#{arch}-macos.zip"
  name "Alire"
  desc "Obtain, build, and incorporate Ada/SPARK libraries into your own projects"
  homepage "https://alire.ada.dev/"

  depends_on :macos

  binary "bin/alr"

  zap trash: "~/.config/alire"
end
