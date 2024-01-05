cask "datastation" do
  version "0.11.0"
  sha256 "5051bc80018dcbbbd1a3d76758843fee099e17146f5d6ee6e29871ef6bcd4dc6"

  url "https://github.com/multiprocessio/datastation/releases/download/#{version}/datastation-darwin-x64-#{version}.zip",
      verified: "github.com/multiprocessio/datastation/"
  name "datastation"
  desc "Open-Source Data IDE for Developers"
  homepage "https://datastation.multiprocess.io/"

  depends_on arch: :x86_64

  app "releases/DataStation Desktop CE-darwin-x64/DataStation Desktop CE.app"
end
