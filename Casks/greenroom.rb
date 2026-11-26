cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.7"
  sha256 arm:   "0551ddab4dd9d28f0ca13fc53c2531eb3d23a8206696f6c50c6e2aa0e25f19c5",
         intel: "d91773260b31856af3a03e6bd3d104978a856ce4493482ec405e3e7938e7300e"

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
