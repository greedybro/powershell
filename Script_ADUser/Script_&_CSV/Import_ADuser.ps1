# Import active directory module for running AD cmdlets
Import-Module activedirectory
  
#Store the data from ADUsers.csv in the $ADUsers variable
$ADUsers = Import-csv -Path "C:\**\listing.csv"

#Loop through each row containing user details in the CSV file 
foreach ($User in $ADUsers)
{
	#Read user data from each field in each row and assign the data to a variable as below
		
	$Username 	= $User.username
	$Password 	= "Azerty123"
	$Firstname 	= $User.firstname
	$Lastname 	= $User.lastname
	$Department = $User.department
	$Title		= $User.title
	$State		= $User.state
  	#$OU 		= $User.ou #This field refers to the OU the user account is to be created in
        #$tel        = $User.tel 

	#Check to see if the user already exists in AD
	if (Get-ADUser -F {SamAccountName -eq "$Username"})
	{
		 #If user does exist, give a warning
		 Write-Warning "L'utilisateur $Username existe déjà dans l'Active Directory."
	}
	else
	{
		#User does not exist then proceed to create the new user account
		
        #Account will be created in the OU provided by the $OU variable read from the CSV file
		New-ADUser `
            -SamAccountName "$Username" `
            -UserPrincipalName "$Username@" `
            -Name "$Firstname $Lastname" `
            -GivenName "$Firstname" `
            -Surname "$Lastname" `
            -Enabled $True `
            -DisplayName "$Firstname $Lastname" `
            -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) `
            -EmailAddress "$Username@" `
            -ChangePasswordAtLogon $true `
            -Path "OU=**,OU=**,DC=**,DC=**" `
            -Department "$Department" `
            -title "$Title" `
            -state "$State" `
            #-OfficePhone "$tel" `
       if ($?) {Write-Host "L'utilisateur $Firstname $Lastname à été ajouté à l'annuaire"}
            
	}
}