# Homebrew Cask Formula for Prowl
#
# 사용법:
#   brew tap bangdori/prowl
#   brew install --cask prowl
#
# 업데이트:
#   brew upgrade --cask prowl

cask "prowl" do
    version "1.48.1"
    sha256 "83b0aef8c21a038724b21cbf337f4d560320379db9cec38c9a331ff4d3444561"
  
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