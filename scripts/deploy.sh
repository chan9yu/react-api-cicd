#!/bin/bash

npm -g install yarn

source ~/.bash_profile
cd ~/git/react-api-cicd/
git pull origin main

# front-end
cd frontend/
yarn install
yarn build
cp -rf dist/* ../backend/public

# back-end
cd ../backend/
yarn install

# pm2
pm2 stop react-api-cicd
pm2 start bin/www --name react-api-cicd --update-env
sleep 2
pm2 list