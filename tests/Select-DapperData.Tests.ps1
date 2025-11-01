Import-Module "$PSScriptRoot\..\psdapper.psm1" -Force

Describe 'Select-DapperObject' {
    It 'Returns a DataTable for a valid query' {
        $connString = 'Server=localhost;Database=master;Trusted_Connection=True;'
        $connection = New-DapperConnection -ConnectionString $connString
    $result = Select-DapperObject -Connection $connection -Query 'SELECT 1 AS TestColumn' -Parameters @{}
        $result.GetType().FullName | Should -Be 'System.Data.DataTable'
        $result.Rows.Count | Should -BeGreaterThan 0
        $connection.Close()
    }

    It 'Throws an error for an invalid query' {
        $connString = 'Server=localhost;Database=master;Trusted_Connection=True;'
        $connection = New-DapperConnection -ConnectionString $connString
    { Select-DapperObject -Connection $connection -Query 'SELECT * FROM NonExistentTable' -Parameters @{} } | Should -Throw
        $connection.Close()
    }
}
