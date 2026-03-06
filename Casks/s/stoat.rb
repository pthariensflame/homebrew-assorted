cask "stoat" do
  arch arm:   "arm64",
       intel: "x64"

  version "1.3.0"
  sha256 arm:   "e81288d6209eec8a8c431cea5466009fc77275a78cf8bee02282a7f1b355f303",
         intel: "9af19d26e6817ca36d5f7688409cdfe09f5da0b2ef408f0dfc43cf2dde23d0a0"

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
