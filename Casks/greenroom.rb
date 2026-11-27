cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.10"
  sha256 arm:   "856e8e0afdd7e67428bbb6465e50f66ea0463abe0fe3436b234437c6c6222678",
         intel: "98bb1a2847821c87050172618af58b6e0c3a622c38dc8f17ad475fda8a8082db"

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
