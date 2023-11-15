$TIGHTVNC_URL = "https://www.tightvnc.com/download/2.8.81/tightvnc-2.8.81-gpl-setup-64bit.msi"
$WEBSOCKIFY_URL = "https://github.com/novnc/websockify/archive/refs/tags/v0.11.0.zip"
$TIGHTVNC_PATH = ".\TightVNC.msi"
$WEBSOCKIFY_PATH = ".\websokify.zip"
$WEBSOCKIFY_DEST = ".\websockify"

Invoke-WebRequest -Uri $TIGHTVNC_URL -OutFile $TIGHTVNC_PATH
Invoke-WebRequest -Uri $WEBSOCKIFY_URL -OutFile $WEBSOCKIFY_PATH

Expand-Archive -Path $WEBSOCKIFY_PATH -DestinationPath $WEBSOCKIFY_DEST

Start-Process -FilePath $TIGHTVNC_PATH -Wait
