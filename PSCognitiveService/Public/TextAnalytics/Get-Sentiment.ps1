Function Get-Sentiment {
    [alias("sentiment")]
    [cmdletbinding()]
    param(
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [System.String[]] $Text
    )

    begin {
    }
    process {
        $Object = @()
        if (Test-LocalConfiguration -ServiceName 'TextAnalytics') {            
            $Object = [TextAnalytics]::new($env:API_SubscriptionKey_TextAnalytics, $env:API_Location_TextAnalytics)
            $Object.getSentiment($Text)     
        }
        Remove-Variable -Name Object
    }
    end {
    }

}

Export-ModuleMember -Function Get-Sentiment -Alias Sentiment
