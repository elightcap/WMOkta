function add-csvtogroup {
    [CmdletBinding( DefaultParametersetName = 'None' )]
    param (
        [Parameter( Mandatory = $true,
            ValueFromPipelineByPropertyName = $true )]
        [string]$csvpath,
        [Parameter( Mandatory = $true,
            ValueFromPipelineByPropertyName = $true )]
        [string]$group,
        [Parameter( Mandatory = $true,
            ValueFromPipelineByPropertyName = $true )]
        [string]$key
    )
    $headers = @{
        "accept"        = "application/json"
        "Content-Type"  = "application/json"
        "Authorization" = $key
    }

    foreach ($user in $csv) {
        $email = $user.email
        $uProfile = invoke-restmethod "https://weedmpas.okta.com/api/v1/users?q=$email" -method get -Headers $headers
        $uID = $uProfile.id
        $gprofile = invoke-restmethod "https://weedmaps.okta.com/api/v1/groups?q=$group" -method get -Headers $headers
        $gID = $gprofile.id
        invoke-restmethod -Uri "https://weedmaps.okta.com/api/v1/groups/$gid/users/$uId" -method put
    }
}
