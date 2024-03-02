cask "julia-alpha" do
  arch arm: "aarch64", intel: "x64"

  version "1.11.0-alpha1"
  sha256 arm:   "4e72b6228b7c1192f92830b756f5f9e65d722cca417925d05a6432c7a868b4a5",
         intel: "6fc8e05a9a20b24dbce3a80cbce7a93f91cef9f42554656c5232c65c9f70719b"

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
