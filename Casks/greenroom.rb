cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.13"
  sha256 arm:   "34908ce0a751920fb72eefb111202d11500423c7205b64e4aad9749afd825da6",
         intel: "57a600ad2afc662dc6cafeeb51bf73a6e99e6923b5b3b172187803f533bc0a2e"

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
