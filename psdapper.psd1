@{
    RootModule        = 'psdapper.psm1'
    ModuleVersion     = '0.1.0'
    GUID              = 'b1a1e2c3-4d5e-6f7a-8b9c-0d1e2f3a4b5c'
    Author            = 'Adam Driscoll'
    Description       = 'PowerShell module for Dapper SQL operations.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('New-DapperConnection', 'Invoke-DapperCommand', 'Select-DapperObject')
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData      = @{
        PSData = @{
            ProjectUri  = 'https://github.com/adamdriscoll/psdapper'
            LicenseUri  = 'https://opensource.org/licenses/MIT'
            Tags        = @('SQL', 'Dapper', 'Database', 'PowerShell')
        }
    }
}