#!/bin/bash

# This install script is intended to install the .NET Core SDK.
#
# Environment variables:
# - DOTNET_SDK_VERSION: the version to install

# Register Microsoft key and feed
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/ubuntu/18.04/prod.list 
mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
chown root:root /etc/apt/sources.list.d/microsoft-prod.list

# Install .NET SDK
apt-get install -y apt-transport-https
apt-get update
apt-get install -y dotnet-sdk-${DOTNET_SDK_VERSION}

# Remove the local package index
rm -rf /var/lib/apt/lists/*

# Print the installed .NET version
dotnet --version