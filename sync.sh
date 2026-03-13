
cd ~/tm/t14p

rm -rf ~/tm/t14p/hypr/default
rm -rf ~/tm/t14p/hypr/config

rm -rf ~/tm/t14p/waybar
rm -rf ~/tm/t14p/.bashrc

cp -r ~/.local/share/omarchy/default/hypr ~/tm/t14p/hypr/default
cp -r ~/.config/hypr ~/tm/t14p/hypr/config

cp -r ~/.config/waybar ~/tm/t14p/waybar


cp -r ~/.bashrc ~/tm/t14p/.bashrc

git add .

git commit -m "update"

git push origin master
