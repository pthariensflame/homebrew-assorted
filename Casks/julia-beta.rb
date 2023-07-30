cask "julia-beta" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.0-beta1"
  sha256 arm:   "6c4195643c14322785554bbcf31cb7d0b7ddf1293e42752ecf740e1a38393ccc",
         intel: "6883f5e0455cb45da25bcefe1effe13ba7c0467ea7c46fcb4d03923589fec7e3"

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
