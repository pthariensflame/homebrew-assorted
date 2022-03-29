cask "datastation" do
  version "0.8.0"
  sha256 "75a62beb2b89be7e6078204f7909c8920a36bd7ebc242126224943b58a2c806c"

  url "https://github.com/multiprocessio/datastation/releases/download/#{version}/datastation-darwin-x64-#{version}.zip",
      verified: "github.com/multiprocessio/datastation"
  name "datastation"
  desc "Open-Source Data IDE for Developers"
  homepage "https://datastation.multiprocess.io/"

  depends_on arch: :x86_64

  app "releases/DataStation Community Edition-darwin-x64/DataStation Community Edition.app"
end
