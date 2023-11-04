cask "julia-rc" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.0-rc1"
  sha256 arm:   "03352ac4ccbfffb3c5628e7c201c8d302e14e9de49f382020ab0b13e75f3a236",
         intel: "7378d9b16c92029b788d0d2526c7c19628626f02e0827b1ee1237d6615299ee0"

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
