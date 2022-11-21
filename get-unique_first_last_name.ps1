PARAM(
[parameter(mandatory=$true)]$FirstName
,[parameter(mandatory=$true)]$LastName
)

$tempLastName = powershell -version 3.0 -command "e:\scripts\test_unique_lastname.ps1 $firstName $lastname"

$tempLastName