cask "julia-rc" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.0-rc1"
  sha256 arm:   "31fea372696352181e5de14bc9c7e7f224bae0091e16c0e5a57a94ee950818e7",
         intel: "63d979374870229d5ba3f2389db4fcca9ba30bca4388af35404fa97a3ec0c481"

  url "https://julialang-s3.julialang.org/bin/mac/#{arch}/#{version.major_minor}/julia-#{version}-mac#{arch.delete_prefix("x")}.dmg"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    url "https://julialang.org/downloads/"
    regex(/href=.*?julia[._-]v?(\d+(?:\.\d+)+-rc\d+)[._-]mac#{arch.delete_prefix("x")}\.dmg/i)
  end

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia", target: "julia-rc"

  zap trash: [
    "~/.julia",
    "~/Library/Preferences/julia.plist",
  ]
end
