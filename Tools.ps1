#
# This script installs the tools needed for NetFORUM debugging on both local and remote environments.
# Comment or remove any items you don't need. If you're not familiar with Chocolatey, it's the easiest way to 
# install software.
#
#
# Install Chocolatey, if you don't have it already.
#
#Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#
# APM tools
# 
#choco install newrelic-dotnet

#
# Developer debugging tools
#
choco install fiddler
choco install beyondcompare
choco install fusionplusplus
choco install sqlsentryplanexplorer
choco install sysinternals
choco install wireshark
choco install logparser
choco install debugdiagnostic
choco install linqpad

#
# Decompilers, pick one or try them both
#
#choco install ilspy
#choco install dotpeek




