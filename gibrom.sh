#!/bin/bash

#While loop to download everything
length="100"
for (( c=1; c<=length; c++ ))
do
   wget -nc https://the-rom.eu/ss/${c}.png
done

