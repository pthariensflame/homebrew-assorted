cask "julia-rc" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.0-rc3"
  sha256 arm:   "43508d0bb9443dfaff3cf379f80f9c1943ff3c768a3f3a08eb76e064f1995cee",
         intel: "63b4d0825408789cf0aa15dd66487b46002f5726f22597d3fce3e89aaad2b7b7"

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
