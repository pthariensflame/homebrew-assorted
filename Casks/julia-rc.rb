cask "julia-rc" do
  version "1.6.0-rc3"
  sha256 "aed1f4fe959e31b6b33d07bc7ef046c110d2522124ec0c4df7d6b423d420bf4c"

  url "https://julialang-s3.julialang.org/bin/mac/x64/#{version.major_minor}/julia-#{version}-mac64.dmg"
  appcast "https://github.com/JuliaLang/julia/releases.atom"
  name "Julia"
  desc "Programming language for technical computing"
  homepage "https://julialang.org/"

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia", target: "julia-rc"

  zap trash: "~/.julia"
end
