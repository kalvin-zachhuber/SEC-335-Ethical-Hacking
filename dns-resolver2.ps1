param (
    [string]$NetworkPrefix,
    [string]$DnsServer
)
#looping through the /24 hosts
For ($i = 1; $i -le 254; $i++) {
    $ipAddress = "$NetworkPrefix.$i"

    # Performing the DNS lookup
    try {
        $dnsResult = Resolve-DnsName -Server $DnsServer -Name $ipAddress -ErrorAction Stop
        $hostname = $dnsResult.NameHost

        # Output the succesfull IP's and their hostname
        Write-Host "$ipAddress $hostname"
    } catch {
        continue
    }
}
        
    
