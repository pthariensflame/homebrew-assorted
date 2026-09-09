cask "stoat" do
  arch arm:   "arm64",
       intel: "x64"

  version "1.5.3"
  sha256 arm:   "ec031ea68abae09acebcad9135879ec33917be01fcb10bbb691f458b9103236d",
         intel: "342922602d21243dfb24a28551d696d5101ee4fb0426d2540d720df8158031a3"

  url "https://github.com/stoatchat/for-desktop/releases/download/v#{version}/Stoat-darwin-#{arch}-#{version}.zip"
  name "Stoat"
  desc "Open-source community-oriented chat app client"
  homepage "https://stoat.chat/"

  livecheck do
    url "https://github.com/stoatchat/for-desktop.git"
    regex(/v?(\d+(?:\.\d+)*)/)
    strategy :git
  end

  depends_on macos: :monterey

  app "Stoat.app"

  zap trash: [
    "~/Library/Application Support/stoat-desktop",
    "~/Library/Caches/com.electron.stoat",
    "~/Library/Caches/com.electron.stoat.ShipIt",
    "~/Library/HTTPStorages/com.electron.stoat",
    "~/Library/Preferences/com.electron.stoat.plist",
  ]
end
