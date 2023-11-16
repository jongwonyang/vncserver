$TIGHTVNC_URL = "https://www.tightvnc.com/download/2.8.81/tightvnc-2.8.81-gpl-setup-64bit.msi"
$WEBSOCKIFY_URL = "https://github.com/novnc/websockify/archive/refs/tags/v0.11.0.zip"
$PYTHON_URL = "https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe"

$TEMP_PATH = ".\temp"
$TIGHTVNC_PATH = "$TEMP_PATH\TightVNC.msi"
$WEBSOCKIFY_PATH = "$TEMP_PATH\websokify.zip"
$WEBSOCKIFY_DEST = "$TEMP_PATH\websockify"
$PYTHON_PATH = "$TEMP_PATH\python-3.12.0.exe"

# Make temp directory
New-Item $TEMP_PATH -ItemType Directory -Force

# Download
Write-Host "Downloading TightVNC... " -NoNewline
Invoke-WebRequest -Uri $TIGHTVNC_URL -OutFile $TIGHTVNC_PATH
Write-Host "Done"
Write-Host "Downloading Websockify... " -NoNewline
Invoke-WebRequest -Uri $WEBSOCKIFY_URL -OutFile $WEBSOCKIFY_PATH
Write-Host "Done"
Write-Host "Downloading Python... " -NoNewline
Invoke-WebRequest -Uri $PYTHON_URL -OutFile $PYTHON_PATH
Write-Host "Done"

# Install TightVNC
Write-Host "Installing TightVNC (Please follow direction)... " -NoNewline
Start-Process -FilePath $TIGHTVNC_PATH -Wait
Write-Host "Done"

# Install python
Write-Host "Installing Python (Please follow direction)... " -NoNewline
Start-Process -FilePath $PYTHON_PATH -Wait
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
Write-Host "Done"

# Install websockify
Write-Host "Installing Websockify... " -NoNewline
Expand-Archive -Path $WEBSOCKIFY_PATH -DestinationPath $WEBSOCKIFY_DEST -Force
Set-Location ".\$WEBSOCKIFY_DEST\websockify-0.11.0"
& python -m pip install setuptools
& python setup.py install
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
Write-Host "Done"

Write-Host "Setup was successful."