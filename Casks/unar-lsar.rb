cask "unar-lsar" do
  version :latest
  sha256 :no_check # required as upstream package is updated in-place

  url "https://cdn.theunarchiver.com/downloads/unarMac.zip"
  name "unar/lsar"
  desc "Command-line unarchiving and archive browsing tools, handling many formats"
  homepage "https://theunarchiver.com/command-line"

  binary "unarMac/unar"
  binary "unarMac/lsar"
end
