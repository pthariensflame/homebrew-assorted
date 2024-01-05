cask "julia-alpha" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.0-alpha1"
  sha256 arm:   "6b57c3a72aa33beed6767bf1167f8a7342f7201f9df3818198dc3fe00e28bcba",
         intel: "cd14bac1b8ef6ce0d3bc5a96a9d0dea595dc0cafab5bcd45323317a9955a1d7c"

  url "https://julialang-s3.julialang.org/bin/mac/#{arch}/#{version.major_minor}/julia-#{version}-mac#{arch.delete_prefix("x")}.dmg"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    url "https://julialang.org/downloads/"
    regex(/href=.*?julia[._-]v?(\d+(?:\.\d+)+-alpha\d+)[._-]mac#{arch.delete_prefix("x")}\.dmg/i)
  end

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia", target: "julia-alpha"

  zap trash: [
    "~/.julia",
    "~/Library/Preferences/julia.plist",
  ]
end
