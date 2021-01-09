cask "julia-beta" do
  version "1.6.0-beta1"
  sha256 "7b62a2bd17e5f9c44d0312cbbcff3a5e41d4f538ccea79d943d57e3265403014"

  url "https://julialang-s3.julialang.org/bin/mac/x64/#{version.major_minor}/julia-#{version}-mac64.dmg"
  appcast "https://github.com/JuliaLang/julia/releases.atom"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia", target: "julia-beta"

  zap trash: "~/.julia"
end
