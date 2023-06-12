# Precheck selenium module
if (Get-Module -name selenium -ListAvailable) {
    Import-Module selenium
} else {
    Install-Module selenium -Force -Confirm:$true -AllowClobber
	Import-Module selenium
}
