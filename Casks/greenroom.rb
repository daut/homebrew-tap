cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "c625cd5b6df27cf94398d5764e61c57ad9a43380a3d42ee234bcadb3a538bf92",
         intel: "09b18ddcbc66f087ace3699bcd25e05dd01566d413ce6dd0d24b11c88487a436"

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
