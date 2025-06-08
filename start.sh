
if [ -z "$UPSTREAM_REPO" ]
then
  echo "Cloning main Repository"
  git clone https://github.com/vigarepo2/MovieMagnetRoBot.git /MovieMagnetRoBot
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO"
  git clone $UPSTREAM_REPO /MovieMagnetRoBot
fi
cd /MovieMagnetRoBot
pip3 install -U -r requirements.txt

echo "Starting MovieMagnetRoBot...."
python3 bot.py
