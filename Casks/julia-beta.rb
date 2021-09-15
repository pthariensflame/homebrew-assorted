cask "julia-beta" do
  version "1.7.0-beta4"
  sha256 "482a5cba9548f16fe6a522e2465210a1fd470d61227ddf0fe08469fff9eaaf74"

  url "https://julialang-s3.julialang.org/bin/mac/x64/#{version.major_minor}/julia-#{version}-mac64.dmg"
  appcast "https://github.com/JuliaLang/julia/releases.atom"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia", target: "julia-beta"

  zap trash: "~/.julia"
end
