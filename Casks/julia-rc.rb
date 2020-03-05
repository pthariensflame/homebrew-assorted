cask 'julia-rc' do
  version '1.4.0-rc2'
  sha256 '101ec0abd9474336942fe14862b9ec3018e85046e230d18d4c9b2521b93bda5a'

  url "https://julialang-s3.julialang.org/bin/mac/x64/#{version.major_minor}/julia-#{version}-mac64.dmg"
  appcast 'https://github.com/JuliaLang/julia/releases.atom'
  name 'Julia'
  homepage 'https://julialang.org/'

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia", target: 'julia-rc'

  zap trash: '~/.julia'
end
