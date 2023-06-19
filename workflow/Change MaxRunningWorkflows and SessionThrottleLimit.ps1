#Change MaxRunningWorkflows and SessionThrottleLimit for Powershell Workflow
#https://isazonov.wordpress.com/2014/11/23/powershell-workflow-настройка-ограничений/

Get-PSSessionConfiguration Microsoft.Powershell.workflow | fl *

$oMaxRunningWorkflows = New-PSWorkflowExecutionOption -MaxRunningWorkflows 150 

Set-PSSessionConfiguration Microsoft.PowerShell.Workflow -SessionTypeOption $oMaxRunningWorkflows -Force

Get-PSSessionConfiguration Microsoft.Powershell.workflow | fl MaxRunningWorkflows




$oMaxRunningWorkflows2 = New-PSWorkflowExecutionOption -MaxRunningWorkflows 150 

Set-PSSessionConfiguration Microsoft.PowerShell.Workflow -SessionTypeOption $oMaxRunningWorkflows2 -Force


$oSessionThrottleLimit = New-PSWorkflowExecutionOption -SessionThrottleLimit 150 

Set-PSSessionConfiguration Microsoft.PowerShell.Workflow -SessionTypeOption $oSessionThrottleLimit -Force

Get-PSSessionConfiguration microsoft.powershell.workflow | fl SessionThrottleLimit