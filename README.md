# PSDapper PowerShell Module

An extremely easy to use PowerShell module for working with SQL databases using Dapper. Provides easy commands for creating connections, selecting data, and executing SQL commands with minimal dependencies.

## Installation

```powershell
Install-PSResource -Name PSDapper -Repository PSGallery
```

## Commands

### New-DapperConnection
Creates and opens a SQL connection.

**Usage:**
```powershell
$connection = New-DapperConnection -ConnectionString "Server=.;Database=Test;Trusted_Connection=True;"
```

### Select-DapperObject
Executes a SQL SELECT query and returns results.

**Usage:**
```powershell
Select-DapperObject -Connection $connection -Query "SELECT * FROM Users WHERE Id = @Id" -Parameters @{ Id = 1 }
```

### Invoke-DapperSqlCommand
Executes a SQL command (INSERT, UPDATE, DELETE) and returns the number of affected rows.

**Usage:**
```powershell
Invoke-DapperCommand -Connection $connection -Command "UPDATE Users SET Name = @Name WHERE Id = @Id" -Parameters @{ Name = 'John'; Id = 1 }
```

## Error Handling
All commands provide meaningful error messages if something goes wrong.

## Help
Each command includes built-in help. Use `Get-Help <CommandName>` for details and examples.

## Testing
Pester unit tests are recommended for validating command functionality.

---
