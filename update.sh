git reset --hard
git pull
sudo chmod +x run.sh

FILES="install/*.sh"
for f in $FILES
do
  echo "Make $f executable"
  # take action on each file. $f store current file name
  sudo chmod +x "$f"
done