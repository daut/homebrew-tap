cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11"
  sha256 arm:   "20c67bdb3158a6fb351804d14bfa4f7d83638b5cc7c66ef4b1ec414076db14a2",
         intel: "e330dcbebe6fc8ea2c634757b1b6eb642c344ad792c7f7986e31db480f20ac1a"

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
