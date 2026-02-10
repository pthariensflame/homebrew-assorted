cask "stoat" do
  arch arm:   "arm64",
       intel: "x64"

  version "1.1.12"
  sha256 arm:   "54c5d3fef7ce8f772bfe42b89418a0defa7bdd226f91c3c3389e0fdda2dc671c",
         intel: "1b3482fdf642ff01a614841cdb0d678ecd1b7f08377eaa347f2cfe3a6eb153ef"

  url "https://github.com/stoatchat/for-desktop/releases/download/v#{version}/Stoat-darwin-#{arch}-#{version}.zip",
      verified: "github.com/stoatchat/for-desktop/"
  name "Stoat"
  desc "Open-source community-oriented chat app client"
  homepage "https://stoat.chat/"

  livecheck do
    url "https://github.com/stoatchat/for-desktop.git"
    regex(/v?(\d+(?:\.\d+)*)/)
    strategy :git
  end

  depends_on macos: ">= :monterey"

  app "Stoat.app"

  zap trash: [
    "~/Library/Application Support/stoat-desktop",
    "~/Library/Caches/com.electron.stoat",
    "~/Library/Caches/com.electron.stoat.ShipIt",
    "~/Library/HTTPStorages/com.electron.stoat",
    "~/Library/Preferences/com.electron.stoat.plist",
  ]
end
