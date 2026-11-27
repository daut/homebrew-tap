cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.14"
  sha256 arm:   "bde7d81fe6be37bf1180272abca48af0398d1c6c7deb141af3644f9185a4181b",
         intel: "8fb319dd8ba1376ff5a673dd8f866f1e121600fe02ff803222d4162c2b23d609"

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
