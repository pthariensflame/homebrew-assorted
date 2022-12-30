cask "julia-rc" do
  arch arm: "aarch64", intel: "x64"

  version "1.8.0-rc4"
  sha256 arm:   "68ea31ad3c77f7570630dbc0a6d2ba9a09e26e4dc1d71045c2c0eab4cf5f2448",
         intel: "b23812d75cf01a8c5b448cfb00589e5f52d9505ec330f268aa67fb53a41ed50b"

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
