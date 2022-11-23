Get-ADUser -Filter '*' -Properties * |
	Select-Object DisplayName, Description, SamAccountName, Enabled, CanonicalName, @{l="Member oF";e={[string]$_.memberof}}, @{n='LastLogon';e={[DateTime]::FromFileTime($_.LastLogon).ToString('yyyy-MM-dd HH:mm')}} |
	Export-Csv 'ist-soll.csv' -NoType