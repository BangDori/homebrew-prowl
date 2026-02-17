# Homebrew Cask Formula for Prowl
#
# 사용법:
#   brew tap bangdori/prowl
#   brew install --cask prowl
#
# 업데이트:
#   brew upgrade --cask prowl

cask "prowl" do
    version "1.26.2"
    sha256 "aa37654d8e5de93b6d807ec2b973d78342fcbbcc4a4397f5ecb33005ab7ccc4e"
  
    url "https://github.com/BangDori/prowl/releases/download/v#{version}/Prowl-#{version}-arm64-mac.zip"
    name "Prowl"
    desc "A cat that watches your background jobs from the macOS menubar"
    homepage "https://github.com/BangDori/prowl"
  
    livecheck do
      url :url
      strategy :github_latest
    end
  
    app "Prowl.app"
 
    postflight do
      system_command "/usr/bin/xattr",
                     args: ["-cr", "#{appdir}/Prowl.app"],
                     sudo: false
    end
    
    zap trash: [
      "~/Library/Application Support/prowl",
      "~/Library/Preferences/com.bangdori.prowl.plist",
    ]
  end