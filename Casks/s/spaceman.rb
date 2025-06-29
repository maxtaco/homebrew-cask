cask "spaceman" do
  version "1.0"
  sha256 "0d8b6005609fc274da11ca2e0f5b327ce4d998be88dbb670d9b3428de5995ae0"

  url "https://s3.amazonaws.com/dev.jaysce.spaceman/Spaceman%20#{version}.dmg",
      verified: "s3.amazonaws.com/dev.jaysce.spaceman/"
  name "Spaceman"
  desc "View Spaces / Virtual Desktops in the menu bar"
  homepage "https://www.jaysce.dev/projects/spaceman"

  livecheck do
    url "https://s3.amazonaws.com/dev.jaysce.spaceman/appcast.xml"
    strategy :sparkle
  end

  no_autobump! because: :requires_manual_review

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Spaceman.app"

  uninstall quit: "dev.jaysce.Spaceman"

  zap trash: [
    "~/Library/Application Scripts/dev.jaysce.Spaceman-LaunchAtLoginHelper",
    "~/Library/Caches/dev.jaysce.Spaceman",
    "~/Library/Containers/dev.jaysce.Spaceman-LaunchAtLoginHelper",
    "~/Library/HTTPStorages/dev.jaysce.Spaceman",
    "~/Library/Preferences/dev.jaysce.Spaceman.plist",
  ]
end
