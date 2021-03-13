cask "julia-rc" do
  version "1.6.0-rc2"
  sha256 "92fe7bc8d805489861e9afeb2beffa720418457f0a7dbb42004dcce1d41aa935"

  url "https://julialang-s3.julialang.org/bin/mac/x64/#{version.major_minor}/julia-#{version}-mac64.dmg"
  appcast "https://github.com/JuliaLang/julia/releases.atom"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia", target: "julia-rc"

  zap trash: "~/.julia"
end
