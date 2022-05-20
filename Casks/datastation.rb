cask "datastation" do
  version "0.10.2"
  sha256 "9107f88981c4476955507338c846b8f6a3a2435270abbb29ae269093b1e67f26"

  url "https://github.com/multiprocessio/datastation/releases/download/#{version}/datastation-darwin-x64-#{version}.zip",
      verified: "github.com/multiprocessio/datastation"
  name "datastation"
  desc "Open-Source Data IDE for Developers"
  homepage "https://datastation.multiprocess.io/"

  depends_on arch: :x86_64

  app "releases/DataStation Community Edition-darwin-x64/DataStation Community Edition.app"
end
