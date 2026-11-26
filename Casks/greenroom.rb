cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.9"
  sha256 arm:   "f16eba11d81ae686193e7c96a0563ecb9286520a199cc21dc53ec66b37225cda",
         intel: "a9ee30ff1aa84937bb116a56d2055c8c748c7cb60e3c69477262e3c3c6ad3880"

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
