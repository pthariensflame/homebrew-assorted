cask "datastation" do
  version "0.7.0"
  sha256 "30c039facc4ea1bad092ea4d5e0918ab1a5874e4c9d71c93ceb22bf9f50356d4"

  url "https://github.com/multiprocessio/datastation/releases/download/#{version}/datastation-darwin-x64-#{version}.zip",
      verified: "github.com/multiprocessio/datastation"
  name "datastation"
  desc "Open-Source Data IDE for Developers"
  homepage "https://datastation.multiprocess.io/"

  depends_on arch: :x86_64

  app "releases/DataStation Community Edition-darwin-x64/DataStation Community Edition.app"
end
