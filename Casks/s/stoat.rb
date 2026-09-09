cask "stoat" do
  arch arm:   "arm64",
       intel: "x64"

  version "1.4.2"
  sha256 arm:   "5d84f90a970a0e5304f6c0a0f06a892590d8f2d35c8e57eca97e342ebc11b1f7",
         intel: "62cbe307229b7c20c8d2b5534ed2972bc788ef44a70855a4311c31075841e375"

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
