cask "julia-beta" do
  arch arm: "aarch64", intel: "x64"

  version "1.9.0-beta3"
  sha256 arm:   "5718060d136c73e53945423ef3f696e5af251ea5a46bfeba10a566f88bf65d60",
         intel: "cae4f541a24ba8522996d5f3ee1a7978340f28bd9ad54f6fdff8227eb1b6bd7f"

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
