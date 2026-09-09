cask "alire" do
  arch arm: "aarch64", intel: "x86_64"

  version "2.1.1"
  sha256 arm:   "2c4867bfff3b95ecd9d846df460a52983d2b0072808b341f8fa5d82494fb309e",
         intel: "d3e16cdfaf0cfb2da62853b79b62910189fdca9d5fddc5c3ac5974ffc7d9544b"

  url "https://github.com/alire-project/alire/releases/download/v#{version}/alr-#{version}-bin-#{arch}-macos.zip"
  name "Alire"
  desc "Obtain, build, and incorporate Ada/SPARK libraries into your own projects"
  homepage "https://alire.ada.dev/"

  depends_on :macos

  binary "bin/alr"

  zap trash: "~/.config/alire"
end
