cask "julia-beta" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.0-beta2"
  sha256 arm:   "3591ea180b98aae9c5f39547f83cf43c16d10bf0a608c50a92f379f01ed33a7b",
         intel: "aa64563f02e91099824b186088fc0f9f7fe7ddbf16cf93329ff13fd686cd0868"

  url "https://julialang-s3.julialang.org/bin/mac/#{arch}/#{version.major_minor}/julia-#{version}-mac#{arch.delete_prefix("x")}.dmg"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    url "https://julialang.org/downloads/"
    regex(/href=.*?julia[._-]v?(\d+(?:\.\d+)+-beta\d+)[._-]mac#{arch.delete_prefix("x")}\.dmg/i)
  end

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia", target: "julia-beta"

  zap trash: [
    "~/.julia",
    "~/Library/Preferences/julia.plist",
  ]
end
