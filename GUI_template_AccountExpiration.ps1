# Template for Powershell GUI application

Add-Type -assembly System.Windows.Forms

$marginLeft1 = 25
$marginTop1 = 25
$marginTop2 = 25
$elementWidth1 = 250
$elementWidth2 = 250

$marginLeft2 = $elementWidth1 + 75

$objFontSize = 11
$labelFontSize = 9

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Set account expiration date'
$main_form.Width = 640
$main_form.Height = 480
$main_form.AutoSize = $true


#Search User ---------------------

$objLabel = New-Object System.Windows.Forms.Label
$objLabel.Location = New-Object System.Drawing.Point($marginLeft1,$marginTop1)
$objLabel.Size = New-Object System.Drawing.Size($elementWidth1,20)
$objLabel.Font = New-Object System.Drawing.Font("Arial",$labelFontSize)
$objLabel.Text = "Search account:"
$main_form.Controls.Add($objLabel) 

$objInput = New-Object System.Windows.Forms.TextBox
$objInput.Location = New-Object System.Drawing.Point($marginLeft1,$($marginTop1*2))
$objInput.Size = New-Object System.Drawing.Size($elementWidth1,20)
$objInput.Font = New-Object System.Drawing.Font("Arial",$objFontSize)
$main_form.Controls.Add($objInput)

$objListBox = New-Object System.Windows.Forms.ListBox
$objListBox.Location  = New-Object System.Drawing.Point($marginLeft1,$($marginTop1*3))
$objListBox.Size = New-Object System.Drawing.Size($elementWidth1,300)
$objListBox.Font = New-Object System.Drawing.Font("Arial",$objFontSize)
$objListBox.Items.Add('Test User1');
$objListBox.Items.Add('Test User2');
$objListBox.Items.Add('Test User3');
$main_form.Controls.add($objListBox)

#---------------------------------

$objLabel2 = New-Object System.Windows.Forms.Label
$objLabel2.Location = New-Object System.Drawing.Point($marginLeft2,$marginTop2)
$objLabel2.Size = New-Object System.Drawing.Size($elementWidth1,20)
$objLabel2.Font = New-Object System.Drawing.Font("Arial",$labelFontSize)
$objLabel2.Text = "Account expiration date"
$main_form.Controls.Add($objLabel2)

$RadioButton24H = New-Object System.Windows.Forms.RadioButton
$RadioButton24H.Location  = New-Object System.Drawing.Point($marginLeft2,$($marginTop2+25))
$RadioButton24H.Font = New-Object System.Drawing.Font("Arial",$labelFontSize)
$RadioButton24H.Text = '24 hours'
$RadioButton24H.AutoSize = $true
$main_form.Controls.Add($RadioButton24H)

$RadioButton48H = New-Object System.Windows.Forms.RadioButton
$RadioButton48H.Location  = New-Object System.Drawing.Point($marginLeft2,$($marginTop2+60))
$RadioButton48H.Font = New-Object System.Drawing.Font("Arial",$labelFontSize)
$RadioButton48H.Text = '48 hours'
$RadioButton48H.AutoSize = $true
$main_form.Controls.Add($RadioButton48H)

$RadioButtonCustomH = New-Object System.Windows.Forms.RadioButton
$RadioButtonCustomH.Location  = New-Object System.Drawing.Point($marginLeft2,$($marginTop2+95))
$RadioButtonCustomH.Font = New-Object System.Drawing.Font("Arial",$labelFontSize)
$RadioButtonCustomH.Text = 'Custom'
$RadioButtonCustomH.AutoSize = $true
$main_form.Controls.Add($RadioButtonCustomH)

$datePicker = New-Object System.Windows.Forms.DateTimePicker
$datePicker.Location  = New-Object System.Drawing.Point($marginLeft2,$($marginTop1+125))
$datePicker.Size = New-Object System.Drawing.Size(120,20)
$datePicker.Font = New-Object System.Drawing.Font("Arial",$objFontSize)
$datePicker.Format = [windows.forms.datetimepickerFormat]::custom
$datePicker.CustomFormat = “dd/MM/yyyy”
$main_form.Controls.add($datePicker)

$minTimePicker = New-Object System.Windows.Forms.DateTimePicker
$minTimePicker.Location = New-Object System.Drawing.Point($($marginLeft2+130),$($marginTop1+125))
$minTimePicker.Size = New-Object System.Drawing.Size(120,20)
$minTimePicker.Font = New-Object System.Drawing.Font("Arial",$objFontSize)
$minTimePicker.Format = [windows.forms.datetimepickerFormat]::custom
$minTimePicker.CustomFormat = "HH:mm:ss"
$minTimePicker.ShowUpDown = $TRUE
$main_form.Controls.Add($minTimePicker)


$button = New-Object System.Windows.Forms.Button
$button.Text = 'Apply'
$button.Location = New-Object System.Drawing.Point($marginLeft2,$($marginTop1+170))
$button.Size = New-Object System.Drawing.Size($elementWidth2,30)
$button.Font = New-Object System.Drawing.Font("Arial",$labelFontSize)
$main_form.Controls.Add($button)


$main_form.ShowDialog()

<#
if (Test-Path "$PSScriptRoot\script.conf") {

    Foreach ($i in $(Get-Content $PSScriptRoot\script.conf)){
        Set-Variable -Name $i.split("=")[0] -Value $i.split("=",2)[1]
    }

    $main_form.ShowDialog()

} else {

    [System.Windows.MessageBox]::Show("Information", "Configuration file script.conf not found", "OK", "None")

}
#>
