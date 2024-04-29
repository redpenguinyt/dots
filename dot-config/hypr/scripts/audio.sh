# Toggle between HDMI and built-in output
touch /tmp/audioSetting
if grep -Fxq "0" /tmp/audioSetting
  then
    echo 1 > /tmp/audioSetting
    pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo+input:analog-stereo
    pactl set-card-profile alsa_card.pci-0000_00_1f.3.3 output:analog-stereo+input:analog-stereo
  else
    echo 0 > /tmp/audioSetting
    pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo+input:analog-stereo
    pactl set-card-profile alsa_card.pci-0000_00_1f.3.3 output:hdmi-stereo+input:analog-stereo
fi
