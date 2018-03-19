function Get-vServers {
    <#   
.SYNOPSIS   
    Build a Global Variable with all current vServer Status.
.DESCRIPTION 
    Build a Global Variable with all current vServer Status.
.PARAMETER NSIP 
    NetScaler IP to Connect To 
.NOTES
    Current Version:        1.0
    Creation Date:          12/03/2018
.CHANGE CONTROL
    Name                    Version         Date                Change Detail
    David Brett             1.0             12/03/2018          Function Creation
.EXAMPLE
    None Required
#> 

    Param
    (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]$NSIP

    )

    # Build Global Variables with all Load Balance vServers on NetScaler
    Write-Verbose "Return all Virtual Servers on $NSIP"
    $vServers = Invoke-RestMethod -uri "$NSIP/nitro/v1/stat/lbvserver" -WebSession $NSSession.WebSession -Method GET

    Return $vServers
}
