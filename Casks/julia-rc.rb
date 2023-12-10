cask "julia-rc" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.0-rc2"
  sha256 arm:   "25340f8907e9b698804ded1041ed9b2ebea20cc22073fb78a024a2af80f9972d",
         intel: "0b2f54326b93129377f3ec827d2a1a662c2bf2256f5edf3bd5829be5afb9082c"

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
