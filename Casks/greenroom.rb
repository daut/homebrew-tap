cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.6"
  sha256 arm:   "9aa9d156485ec261e2208275cfd438b7a13ec6844d2e67be30f2c1b230995d35",
         intel: "e124a7df65e170a53fea0e3deb76a7354ede448cc9f04b7a581a46d2e22af7a8"

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
