# TODO: Make an install scrip
#
if [ -f "$HOME/.bootstrap-complete" ]; then
  echo "Already installed. Skipping"
  exit 0
fi

# install the stuff

touch "$HOME/.bootstrap-complete"
