@{
    RootModule        = 'psdapper.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = 'b1a1e2c3-4d5e-6f7a-8b9c-0d1e2f3a4b5c'
    Author            = 'Adam Driscoll'
    Description       = 'PowerShell module for Dapper SQL operations.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('New-DapperConnection', 'Invoke-DapperCommand', 'Select-DapperObject')
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    FileList         = @('Dapper.dll', 'psdapper.psm1', 'psdapper.dll', 'System.Reflection.Emit.Lightweight.dll', 'System.Reflection.Emit.ILGeneration.dll')
    PrivateData      = @{
        PSData = @{
            ProjectUri  = 'https://github.com/adamdriscoll/psdapper'
            LicenseUri  = 'https://opensource.org/licenses/MIT'
            Tags        = @('SQL', 'Dapper', 'Database', 'PowerShell')
        }
    }
}