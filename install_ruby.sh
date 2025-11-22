#!/bin/bash
set -e

sudo apt update
sudo apt install -y libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev 

if [ ! -d "$HOME/.rbenv" ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
else
  echo "rbenv is already installed."
fi

mkdir -p ~/.rbenv/plugins
if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

# .bashrcに過剰な追記防止
if ! grep -q "rbenv init" ~/.bashrc; then
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
fi

# .profileにも同じ内容を書く（nvim用)
if ! grep -q "rbenv init" ~/.profile; then
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
  echo 'eval "$(rbenv init -)"' >> ~/.profile
fi

# 直接PATHを通して rbenv を有効化
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# 最新のRubyを選ぶ
LATEST_RUBY=$(rbenv install -l | grep -v - | tail -1)
# 既にあるならスキップ
if ! rbenv versions | grep -q "$LATEST_RUBY"; then
  rbenv install "$LATEST_RUBY"
fi

rbenv global "$LATEST_RUBY"

gem install solargraph

ruby -v
