cask "julia-beta" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.0-beta3"
  sha256 arm:   "68a6362231452e83230823a247e100e4bf6eac53a3d7451ee7ef9978c7fffd3a",
         intel: "d6f3ac55100af4afbd259752ce50399c9935374d38d2a15a101d0cd08ce4b933"

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
