# PowerShell module for Dapper SQL operations
# Function stubs to be implemented

<#!
.SYNOPSIS
Executes a SQL SELECT query and returns results as either PSCustomObject or DataRow.
.DESCRIPTION
Runs a SQL query using the provided connection and parameters, returning results as PSCustomObject (default) or DataRow.
.PARAMETER Connection
A SQL connection object.
.PARAMETER Query
The SQL SELECT query to execute.
.PARAMETER Parameters
A hashtable of query parameters.
.PARAMETER As
Specifies the output type: PSCustomObject (default) or DataRow.
.EXAMPLE
Select-DapperObject -Connection $connection -Query "SELECT * FROM Users" -As PSCustomObject
#>
function Select-DapperObject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [object]$Connection,
        [Parameter(Mandatory)]
        [string]$Query,
        [Parameter()]
        [hashtable]$Parameters
    )
    try {
        $dapperDll = Join-Path $PSScriptRoot 'Dapper.dll'
        Add-Type -Path $dapperDll
        $dapperType = [System.Reflection.Assembly]::LoadFrom($dapperDll).GetType('Dapper.SqlMapper')
        if ($Parameters) {
            $Rows = $dapperType::Query($Connection, $Query, $Parameters)
        } else {
            $Rows = $dapperType::Query($Connection, $Query)
        }

        foreach($row in $Rows) {
            $props = @{}

            foreach ($kvp in $row) {
                $props[$kvp.Key] = $kvp.Value
            }
            [PSCustomObject]$props
        }
        
    } catch {
        Write-Error "Failed to select object with Dapper: $_"
    }
}

<#!
.SYNOPSIS
Creates a new SQL connection using the provided connection string.
.DESCRIPTION
Establishes and opens a SQL connection object for use with Dapper commands.
.PARAMETER ConnectionString
The connection string to use for the SQL connection.
.EXAMPLE
$connection = New-DapperConnection -ConnectionString "Server=.;Database=Test;Trusted_Connection=True;"
#>
function New-DapperConnection {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$ConnectionString
    )
    try {
        Add-Type -AssemblyName System.Data
        $connection = New-Object System.Data.SqlClient.SqlConnection $ConnectionString
        $connection.Open()
        # Dapper works with IDbConnection, so this connection is ready for Dapper methods in .NET
        return $connection
    } catch {
        Write-Error "Failed to create connection: $_"
    }
}

<#!
.SYNOPSIS
Executes a SQL command (INSERT, UPDATE, DELETE).
.DESCRIPTION
Runs a non-query SQL command using the provided connection and parameters, returning the number of affected rows.
.PARAMETER Connection
A SQL connection object.
.PARAMETER Command
The SQL command to execute (INSERT, UPDATE, DELETE).
.PARAMETER Parameters
A hashtable of command parameters.
.EXAMPLE
Invoke-DapperSqlCommand -Connection $connection -Command "UPDATE Users SET Name = @Name WHERE Id = @Id" -Parameters @{ Name = 'John'; Id = 1 }
#>
function Invoke-DapperCommand {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [object]$Connection,
        [Parameter(Mandatory)]
        [string]$Command,
        [Parameter()]
        [hashtable]$Parameters
    )
    try {
        $dapperDll = Join-Path $PSScriptRoot 'Dapper.dll'
        Add-Type -Path $dapperDll
        $dapperType = [System.Reflection.Assembly]::LoadFrom($dapperDll).GetType('Dapper.SqlMapper')
        if ($Parameters) {
            $affectedRows = $dapperType::Execute($Connection, $Command, $Parameters)
        } else {
            $affectedRows = $dapperType::Execute($Connection, $Command)
        }
        return $affectedRows
    } catch {
        Write-Error "Failed to execute SQL command with Dapper: $_"
    }
}
