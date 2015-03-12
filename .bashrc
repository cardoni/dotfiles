# source 'autoenv' so that it can source '.env' files on each 'cd'
source /usr/local/opt/autoenv/activate.sh

# export PATH="$HOME/.rbenv/bin:$ORIGINAL_PATH"
export PATH="$HOME:$ORIGINAL_PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin/node:$PATH"
export PATH="~/.nvm:$PATH"
# export PATH="/usr/local/share/npm/bin:$PATH"
# export PATH=$(npm bin):$PATH

export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"

# I believe running cucumber specs required the below or else would bark at me
export LC_CTYPE="en_US.UTF-8"

# OpenSSL was installed via Brew
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# Set Browser
# export BROWSER=google-chrome

# nvm - https://github.com/creationix/nvm
# sets nvm dir and loads nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh