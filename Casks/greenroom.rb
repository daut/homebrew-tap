cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.12"
  sha256 arm:   "fad6990e5cddfa256a43d06e7e65b39e446c89b94a49ca6586583290a41a0ea6",
         intel: "93b3d9d442c33ce743ebacd1a6f4f6747292241deeaf55160f3a4ebbf5003ee3"

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
