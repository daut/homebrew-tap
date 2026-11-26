cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.8"
  sha256 arm:   "11c6f6cd8a4a23b966f5ed57ed48b195ff94e36ec5ef1b93185a179045fa5e20",
         intel: "26e139f4f89f83143375c99af384f43812606b9134005e0dd9929b71f7fa464c"

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
