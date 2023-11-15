$TIGHTVNC_URL = "https://www.tightvnc.com/download/2.8.81/tightvnc-2.8.81-gpl-setup-64bit.msi"
$TIGHTVNC_PATH = "C:\Temp\TightVNC.msi"

Invoke-WebRequest -Uri $TIGHTVNC_URL -OutFile $TIGHTVNC_PATH

Start-Process msiexec -ArgumentList "/i $TIGHTVNC_PATH /qn" -Wait
