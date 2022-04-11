cask "datastation" do
  version "0.9.0"
  sha256 "56ad6196bdb1fde479931ba8e78acf151dcf8e9b4e52602c6e3f608c9b342e68"

  url "https://github.com/multiprocessio/datastation/releases/download/#{version}/datastation-darwin-x64-#{version}.zip",
      verified: "github.com/multiprocessio/datastation"
  name "datastation"
  desc "Open-Source Data IDE for Developers"
  homepage "https://datastation.multiprocess.io/"

  depends_on arch: :x86_64

  app "releases/DataStation Community Edition-darwin-x64/DataStation Community Edition.app"
end
