$TIGHTVNC_URL = "https://www.tightvnc.com/download/2.8.81/tightvnc-2.8.81-gpl-setup-64bit.msi"
$WEBSOCKIFY_URL = "https://github.com/novnc/websockify/archive/refs/tags/v0.11.0.zip"
$PYTHON_URL = "https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe"

$TIGHTVNC_PATH = ".\temp\TightVNC.msi"
$WEBSOCKIFY_PATH = ".\temp\websokify.zip"
$WEBSOCKIFY_DEST = ".\temp\websockify"
$PYTHON_PATH = ".\temp\python-3.12.0.exe"

# Make temp directory
New-Item temp -ItemType Directory -Force

# Download
Invoke-WebRequest -Uri $TIGHTVNC_URL -OutFile $TIGHTVNC_PATH
Invoke-WebRequest -Uri $WEBSOCKIFY_URL -OutFile $WEBSOCKIFY_PATH
Invoke-WebRequest -Uri $PYTHON_URL -OutFile $PYTHON_PATH

# Install TightVNC
Start-Process -FilePath $TIGHTVNC_PATH -Wait

# Install python
Start-Process -FilePath $PYTHON_PATH -Wait

# Install websockify
Expand-Archive -Path $WEBSOCKIFY_PATH -DestinationPath $WEBSOCKIFY_DEST -Force
& python -m pip install setuptools
Set-Location ".\$WEBSOCKIFY_DEST\websockify-0.11.0"
& python .\$WEBSOCKIFY_DEST\websockify-0.11.0setup.py install
