Get-Content .\IPAddresses.txt | ForEach-Object {
    $obj = "" | Select-Object IPAddress,TestConexionIP
    try { 
        $obj.TestConexionIP = Test-Connection -ComputerName $_ -Quiet -Count 1
    } catch { 
        $obj.TestConexionIP = 'Unknown Host'
    }	
    $obj.IPAddress = $_
    $obj
} | Export-Csv -Path BatchPingLog.csv -NoType
