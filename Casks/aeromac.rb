cask "aeromac" do
  version "1.3.0"
  sha256 "774af7c8eb604d24db788d21570180dca0e1ef85f6ea8b55443ceefaff263fe6"

  url "https://aeromac.app/v1/AeroMac-#{version}-arm64.dmg"
  name "AeroMac"
  desc "Fan control and temperature monitor for Apple Silicon Macs"
  homepage "https://aeromac.app/"

  livecheck do
    url "https://aeromac.app/v1/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "AeroMac.app"

  uninstall quit: "com.udhav.macfancontrol"

  zap trash: [
    "~/Library/Caches/com.udhav.macfancontrol",
    "~/Library/HTTPStorages/com.udhav.macfancontrol",
    "~/Library/Preferences/com.udhav.macfancontrol.plist",
    "~/Library/Saved Application State/com.udhav.macfancontrol.savedState",
  ]

  caveats <<~EOS
    If you installed AeroMac's privileged fan-control helper, return fans to
    Automatic and remove the helper in AeroMac → Settings → Helper before
    uninstalling.
  EOS
end
