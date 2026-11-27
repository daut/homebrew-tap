cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.15"
  sha256 arm:   "41b5158b434b1780c1a800df32b0d93b2e9997a2f869c4297a2d834384dd2f39",
         intel: "14cf423a6563d5bab6ea7e39418b201654d313cd8931f79e57c9ef5b5ffe56f9"

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
