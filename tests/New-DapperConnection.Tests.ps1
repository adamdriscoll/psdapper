Import-Module "$PSScriptRoot\..\psdapper.psm1" -Force

Describe 'New-DapperConnection' {
    It 'Returns a SqlConnection object for a valid connection string' {
        $connString = 'Server=localhost;Database=master;Trusted_Connection=True;'
        $connection = New-DapperConnection -ConnectionString $connString
        $connection.GetType().FullName | Should -Be 'System.Data.SqlClient.SqlConnection'
        $connection.State | Should -Be 'Open'
        $connection.Close()
    }

    It 'Throws an error for an invalid connection string' {
        { New-DapperConnection -ConnectionString 'invalid' } | Should -Throw
    }
}
