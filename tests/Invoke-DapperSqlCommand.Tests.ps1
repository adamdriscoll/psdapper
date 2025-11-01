Import-Module "$PSScriptRoot\..\psdapper.psm1" -Force

Describe 'Invoke-DapperSqlCommand' {
    It 'Returns affected rows for a valid command' {
        $connString = 'Server=localhost;Database=master;Trusted_Connection=True;'
        $connection = New-DapperConnection -ConnectionString $connString
        $result = Invoke-DapperSqlCommand -Connection $connection -Command 'SELECT 1' -Parameters @{}
        $result | Should -Be 0
        $connection.Close()
    }

    It 'Throws an error for an invalid command' {
        $connString = 'Server=localhost;Database=master;Trusted_Connection=True;'
        $connection = New-DapperConnection -ConnectionString $connString
        { Invoke-DapperSqlCommand -Connection $connection -Command 'INVALID SQL' -Parameters @{} } | Should -Throw
        $connection.Close()
    }
}
