cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "d09308f45e9be06fc9885f02dc5ef7a6b95e93c13588a8d440d0933a6ef0b043",
         intel: "93c07feec3ca74187b50d1a199bad2aee1c5b95976f025e0ebff3d9c70de91b2"

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
