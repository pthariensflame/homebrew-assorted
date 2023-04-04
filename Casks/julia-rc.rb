cask "julia-rc" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.0-rc2"
  sha256 arm:   "2706e215970a7a6ae2bbd1f62f08181c373dabb093fd43b90c097f5b4e2c3576",
         intel: "6a74ac67088c0eb50c5cbdff46a88a9b856fba721f3cf51e80ef10d7991609d5"

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
