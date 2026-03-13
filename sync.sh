
cd ~/tm/t14p

LATEST=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0")
VERSION="v$(echo $LATEST | sed 's/v//' | awk -F. '{printf "%d.%d", $1, $2+1}')"

rm -rf ~/tm/t14p/hypr/default
rm -rf ~/tm/t14p/hypr/config
rm -rf ~/tm/t14p/waybar
rm -rf ~/tm/t14p/.bashrc
cp -r ~/.local/share/omarchy/default/hypr ~/tm/t14p/hypr/default
cp -r ~/.config/hypr ~/tm/t14p/hypr/config
cp -r ~/.config/waybar ~/tm/t14p/waybar
cp ~/.bashrc ~/tm/t14p/.bashrc

git add .
git commit -m "update $VERSION"
git tag $VERSION
git push origin master


