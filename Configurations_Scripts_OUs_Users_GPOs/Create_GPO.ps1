
# This script applies 2 GPOs domain-wide:

# Password Policy (90-day expiry, complexity enabled)
# Screen Lock Policy (10 minute timeout)

$DomainDN = (Get-ADDomain).DistinguishedName


Import-Module GroupPolicy
Import-Module ActiveDirectory

# PASSWORD POLICY
Write-Host "Configuring Password Policy        " -ForegroundColor Cyan

try {
    Set-ADDefaultDomainPasswordPolicy `
        -Identity (Get-ADDomain).DNSRoot `
        -MaxPasswordAge "90.00:00:00" `
        -ComplexityEnabled $true `
        -ErrorAction Stop

    Write-Host "Success: Password policy updated (90-day expiry, complexity ON)" -ForegroundColor Green
}
catch {
    Write-Error "Failed to update password policy: $_"
}

# SCREEN LOCK POLICY
Write-Host "Creating Screen Lock GPO" -ForegroundColor Cyan

$GPOName = "Screen Lock Policy"

# Check if the GPO already exists
$ExistingGPO = Get-GPO -Name $GPOName -ErrorAction SilentlyContinue

if ($ExistingGPO) {
    Write-Host "Skipping: GPO '$GPOName' already exists." -ForegroundColor Yellow
    $GPO = $ExistingGPO
} else {
    try {
        $GPO = New-GPO -Name $GPOName -ErrorAction Stop
        Write-Host "Success: Created GPO '$GPOName'" -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to create GPO: $_"
    }
}

# Configure screen lock settings (600 seconds)
try {
    # Enable screensaver
    Set-GPRegistryValue -Name $GPOName `
        -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" `
        -ValueName "ScreenSaveActive" -Type String -Value "1" -ErrorAction Stop

    # Set timeout to 600 seconds (10 minutes)
    Set-GPRegistryValue -Name $GPOName `
        -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" `
        -ValueName "ScreenSaveTimeOut" -Type String -Value "600" -ErrorAction Stop

    # Require password on resume
    Set-GPRegistryValue -Name $GPOName `
        -Key "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" `
        -ValueName "ScreenSaverIsSecure" -Type String -Value "1" -ErrorAction Stop

    Write-Host "Success: Screen lock settings configured (10 min, password required)" -ForegroundColor Green
}
catch {
    Write-Error "Failed to configure screen lock settings: $_"
}

# Link the GPO to the domain root
try {
    New-GPLink -Name $GPOName -Target $DomainDN -ErrorAction Stop
    Write-Host "Success: GPO linked to domain root" -ForegroundColor Green
}
catch {
    if ($_.Exception.Message -like "*already linked*") {
        Write-Host "Skipping: GPO already linked to domain root." -ForegroundColor Yellow
    } else {
        Write-Error "Failed to link GPO: $_"
    }
}