cask "julia-rc" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.0-rc3"
  sha256 arm:   "748ca70568fcb348e8b6e6a3fa8bf8eb9752cbd523da5461cff2b5c5250ce487",
         intel: "fca793d3f8b7d96ef5df999c7dc5f5bd076c206949840a73fd6d6a4ef687c975"

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
