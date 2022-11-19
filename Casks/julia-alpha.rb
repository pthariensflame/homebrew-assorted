cask "julia-alpha" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.0-alpha1"
  sha256 arm:   "9700498483aa91d1562f8e66cab64a052a62710e1cf0eb07de347d476d984fa4",
         intel: "885135681d42e7cff5bca168a9805b473dc2c41c582538de24e4fdf270b800af"

  url "https://julialang-s3.julialang.org/bin/mac/#{arch}/#{version.major_minor}/julia-#{version}-mac#{arch.delete_prefix("x")}.dmg"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  livecheck do
    url "https://julialang.org/downloads/"
    regex(/href=.*?julia[._-]v?(\d+(?:\.\d+)+-alpha\d+)[._-]mac#{arch.delete_prefix("x")}\.dmg/i)
  end

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia"

  zap trash: [
    "~/.julia",
    "~/Library/Preferences/julia.plist",
  ]
end
