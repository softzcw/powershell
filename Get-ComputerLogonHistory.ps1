Function Get-ComputerLogonHistory{
<#
 The function are displayed for each user: login name, the remote host, login time
 auth:peter
 qq:11204192
#>
[CmdletBinding()] Param()
$XMLFilter='<QueryList>
  <Query Id="0" Path="Microsoft-Windows-TerminalServices-LocalSessionManager/Operational">
    <Select Path="Microsoft-Windows-TerminalServices-LocalSessionManager/Operational">*[System[(EventID=21 or EventID=25)]]</Select>
  </Query>
</QueryList>'

$Events=get-winevent -filterXml $XMLFilter -MaxEvents 1000

            
# Parse out the event message data            
ForEach ($Event in $Events) {    

      
    # Convert the event to XML            
    $eventXML = [xml]$Event.ToXml()     
    # Append these as object properties            
    Add-Member -InputObject $Event -MemberType NoteProperty -Force -Name  IP -Value $eventXML.Event.userdata.eventXML.address   
    
    Add-Member -InputObject $Event -MemberType NoteProperty -Force -Name  User -Value $eventXML.event.userdata.eventxml.user 
              
}            
  
    
$events | select TimeCreated,User,IP
#$events
}
