cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "bbbbddcd0e75053e5a908ce94b6d80d386c2ebfec254b0682450481309dff72e",
         intel: "0e2c044a63ec11f4106d511cc192b81bdd9793ed280dfeb8ecc5e5a9856b1cae"

  url "https://github.com/daut/greenroom/releases/download/v#{version}/greenroom-mac-#{arch}.zip"
  name "Greenroom"
  desc "Personal interview and presentation trainer with realtime voice mock sessions"
  homepage "https://github.com/daut/greenroom"

  depends_on macos: :ventura

  app "Greenroom.app"

  caveats <<~EOS
    Greenroom isn't notarized by Apple. Before the first launch, run:
      xattr -dr com.apple.quarantine "#{appdir}/Greenroom.app"
  EOS

  zap trash: [
    "~/Library/Application Support/Greenroom",
    "~/Library/Preferences/dev.daut.greenroom.plist",
  ]
end
