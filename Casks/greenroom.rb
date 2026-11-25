cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "add4c9479ccf3d7b6d5e107d46b81c6a8d1ea7fa6a81b06f3c4d3464712fcc5a",
         intel: "9b1c8a418fcd65de39e0dd6b51f8e56e4b9c9014f22d05e9fe43b7a19aabe80b"

  url "https://github.com/daut/greenroom/releases/download/v#{version}/greenroom-mac-#{arch}.zip"
  name "Greenroom"
  desc "Personal interview and presentation trainer with realtime voice mock sessions"
  homepage "https://github.com/daut/greenroom"

  depends_on macos: :monterey

  app "Greenroom.app"

  caveats <<~EOS
    Greenroom isn't signed with an Apple Developer ID yet. Before the first launch, run:
      xattr -dr com.apple.quarantine "#{appdir}/Greenroom.app"
  EOS

  zap trash: [
    "~/Library/Application Support/Greenroom",
    "~/Library/Preferences/dev.daut.greenroom.plist",
  ]
end
