# ---- Error Handling ----
# $ErrorActionPreference = "SilentlyContinue" #This is for ErrorHandling, Uncomment to ignore errors.

# ---- Variables ----
$ExportPath = "C:\pst_exports\"
$Export_FileType = ".pst"

# ---- Data Import ----
$Mailboxes = Import-Csv -Path '.\mailbox-import.csv' -Delimiter ','  -Header @("mailboxID")
Write-Host "CSV Imported Successfully" -ForegroundColor "green"

# ---- Action ----
$data = foreach ( $Mailbox in $Mailboxes ) { 
    New-MailboxExportRequest -Mailbox $Mailbox.mailboxID -Name $mailbox.mailboxID -FilePath ${ExportPath}${Mailbox.MailboxID}${Export_FileType}
    Write-Host "Exported $Mailbox.MailboxID Successfully"
    
} 
$data | Out-File '.\Exchange-Data-Export.csv'
