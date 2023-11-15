$TIGHTVNC_URL = "https://www.tightvnc.com/download/2.8.81/tightvnc-2.8.81-gpl-setup-64bit.msi"
$WEBSOCKIFY_URL = "https://github.com/novnc/websockify/archive/refs/tags/v0.11.0.zip"
$PYTHON_URL = "https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe"

$TIGHTVNC_PATH = ".\TightVNC.msi"
$WEBSOCKIFY_PATH = ".\websokify.zip"
$WEBSOCKIFY_DEST = ".\websockify"
$PYTHON_PATH = ".\python-3.12.0.exe"

# Download
Invoke-WebRequest -Uri $TIGHTVNC_URL -OutFile $TIGHTVNC_PATH
Invoke-WebRequest -Uri $WEBSOCKIFY_URL -OutFile $WEBSOCKIFY_PATH
Invoke-WebRequest -Uri $PYTHON_URL -OutFile $PYTHON_PATH

# Install TightVNC
Start-Process -FilePath $TIGHTVNC_PATH -Wait

# Install Python
Start-Process -FilePath $PYTHON_PATH -Wait

# Install noVNC
Expand-Archive -Path $WEBSOCKIFY_PATH -DestinationPath $WEBSOCKIFY_DEST -Force
Start-Process -FilePath "python" -ArgumentList ".\$WEBSOKIFY_DEST\websokify-0.11.0\setup.py", "install" -Wait
