#!/bin/bash

if [[ $1 == "lua" ]]; then
  echo "to lua"
  mv init.vim init.vim.bak
  mv init.lua.bak init.lua
elif [[ $1 == "vim" ]]; then
  echo "to lua"
  mv init.vim.bak init.vim
  mv init.lua init.lua.bak
fi
