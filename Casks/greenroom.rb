cask "greenroom" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "125907063327ae96e301b3c8a8c12eb8b3af0ba4a43a248614919a41be4f81e7",
         intel: "381e34bb295a9f7db2b9e44eb4729c3b0d8fb962a90bbc8fad7d09234b66dad9"

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
