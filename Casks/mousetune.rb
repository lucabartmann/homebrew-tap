cask "mousetune" do
  version "1.0.0"
  sha256 "8426107c3a391e10314f3ad0c71915e4a719504f7e2513cc394f064f9922d8da"

  url "https://github.com/lucabartmann/MouseTune/releases/download/v#{version}/MouseTune-#{version}.zip"
  name "MouseTune"
  desc "Menu bar app to tune mouse pointer speed, scrolling and buttons"
  homepage "https://github.com/lucabartmann/MouseTune"

  depends_on macos: ">= :ventura"

  app "MouseTune.app"

  # Release builds are not notarized; clear the quarantine flag so Gatekeeper doesn't block them.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MouseTune.app"]
  end

  zap trash: "~/Library/Preferences/local.MouseTune.plist"

  caveats <<~EOS
    MouseTune needs the Accessibility permission:
      System Settings → Privacy & Security → Accessibility
  EOS
end
