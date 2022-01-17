# Stop MenuTools if it is running
Get-Process -ProcessName MenuTools -ErrorAction 0 | Stop-Process -ErrorAction 0
