cask "stoat" do
  arch arm:   "arm64",
       intel: "x64"

  version "1.5.4"
  sha256 arm:   "99395c607acab3a61834ccbbf874f2e05e4ad4a7782747f987376d14145e9fbf",
         intel: "a8ea9ec32fd47881b4db4ecfbe3dac0bbc64b6db9f1e85b87cf57a1575ae11c9"

  url "https://github.com/stoatchat/for-desktop/releases/download/v#{version}/Stoat-darwin-#{arch}-#{version}.zip"
  name "Stoat"
  desc "Open-source community-oriented chat app client"
  homepage "https://stoat.chat/"

  livecheck do
    url "https://github.com/stoatchat/for-desktop.git"
    regex(/v?(\d+(?:\.\d+)*)/)
    strategy :git
  end

  depends_on macos: :ventura

  app "Stoat.app"

  zap trash: [
    "~/Library/Application Support/stoat-desktop",
    "~/Library/Caches/com.electron.stoat",
    "~/Library/Caches/com.electron.stoat.ShipIt",
    "~/Library/HTTPStorages/com.electron.stoat",
    "~/Library/Preferences/com.electron.stoat.plist",
  ]
end
