# Get group members

# OU group
$group =[adsi]"LDAP://CN=UserGroup,OU=MyOU,DC=bgelov,DC=ru"

$members = $group.psbase.invoke("Members") | foreach {$_.GetType().InvokeMember("samaccountname",'GetProperty',$null,$_,$null)} 
$members.count
