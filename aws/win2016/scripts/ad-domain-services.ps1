# AD-Domain-Servicesを有効
install-windowsfeature -name AD-Domain-Services -IncludeManagementTools

# 必要なモジュールをインポート
Import-Module ADDSDeployment

# ADDSForestをインストール
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "gekal.local" `
-SafeModeAdministratorPassword (ConvertTo-SecureString -String "P@asswr0rd" -AsPlainText -Force) `
-DomainNetbiosName "PROTOSOFT" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true
