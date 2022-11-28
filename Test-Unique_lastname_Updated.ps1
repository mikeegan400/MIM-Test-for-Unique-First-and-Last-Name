PARAM(
[parameter(mandatory=$true)]$FirstName
,[parameter(mandatory=$true)]$LastName
)

import-module activedirectory

[int]$counter = 2
$tempLastName = $LastName

$results = get-aduser -filter(givenName -eq $FirstName -and surname -like $tempLastName) | select-object givenName,surname | measure-object

While ($results.count -eq 1)
{
	$tempLastName = $LastName + $counter
	$results = get-aduser -filter(givenName -eq $FirstName -and surname -like $tempLastName) | select-object givenName,surname | measure-object

  $counter++
}

$tempLastName
