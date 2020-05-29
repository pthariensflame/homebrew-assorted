cask 'julia-beta' do
  version '1.5.0-beta1'
  sha256 '38636764ec87afe6367ef1baf160d6f8267a0ba87db322ab189aee228917adc1'

  url "https://julialang-s3.julialang.org/bin/mac/x64/#{version.major_minor}/julia-#{version}-mac64.dmg"
  appcast 'https://github.com/JuliaLang/julia/releases.atom'
  name 'Julia'
  homepage 'https://julialang.org/'

  app "Julia-#{version.major_minor}.app"
  binary "#{appdir}/Julia-#{version.major_minor}.app/Contents/Resources/julia/bin/julia", target: 'julia-beta'

  zap trash: '~/.julia'
end
