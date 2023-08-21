cask "julia-beta" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.0-beta2"
  sha256 arm:   "6d72ca9dd0583f184284e26d83556dc385ceacc80d918da48fbe028d1861aa08",
         intel: "f3dc31a34c3da5332a4c831760658d1304b75629946f10ea7cf891dc1996da3c"

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
