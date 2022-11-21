PARAM(
[parameter(mandatory=$true)]$FirstName
,[parameter(mandatory=$true)]$LastName
)

import-module activedirectory

[int]$counter = 2
$tempLastName = $LastName

$results = get-aduser -filter * -properties * | where-object {$_.givenName -eq $FirstName -and $_.sn -like $tempLastName} | select-object givenname,sn | Measure-object

While ($results.count -eq 1)
{
	$tempLastName = $LastName + $counter
	$results = get-aduser -filter * -properties * | where-object {$_.givenName -eq $FirstName -and $_.sn -like $tempLastName} | select-object givenName,sn | measure-object
	$counter++
}

$tempLastName
