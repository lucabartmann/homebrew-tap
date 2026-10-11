cask "mousetune" do
  version "1.2.0"
  sha256 "eb6a33b34eb31d257f8cbd31272194a2168bc11afb6463ad7f7c32c549e39215"

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
