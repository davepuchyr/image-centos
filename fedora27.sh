#!/bin/bash

make clean 

cp -av /etc/ssh/*key* .

time make image_on_local

