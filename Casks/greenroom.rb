cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.4"
  sha256 arm:   "d449d50d4ab2ec4f3b1d51d46c3ca3ccbf655308b467d30eef47fc5535e3a300",
         intel: "fc86f50f3fbffab50f765ae200a5b5e6cca0d570a719f5700d09564788699863"

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
