# PSDapper PowerShell Module

A PowerShell module for working with SQL databases using Dapper-like commands. Provides easy commands for creating connections, selecting data, and executing SQL commands.

## Installation

1. Copy the `psdapper` folder to your PowerShell modules directory (e.g., `$env:USERPROFILE\Documents\WindowsPowerShell\Modules`).
2. Import the module:
   ```powershell
   Import-Module psdapper
   ```

## Commands

### New-DapperConnection
Creates and opens a SQL connection.

**Usage:**
```powershell
$connection = New-DapperConnection -ConnectionString "Server=.;Database=Test;Trusted_Connection=True;"
```

### Select-DapperData
Executes a SQL SELECT query and returns results as a DataTable.

**Usage:**
```powershell
Select-DapperData -Connection $connection -Query "SELECT * FROM Users WHERE Id = @Id" -Parameters @{ Id = 1 }
```

### Invoke-DapperSqlCommand
Executes a SQL command (INSERT, UPDATE, DELETE) and returns the number of affected rows.

**Usage:**
```powershell
Invoke-DapperSqlCommand -Connection $connection -Command "UPDATE Users SET Name = @Name WHERE Id = @Id" -Parameters @{ Name = 'John'; Id = 1 }
```

## Error Handling
All commands provide meaningful error messages if something goes wrong.

## Help
Each command includes built-in help. Use `Get-Help <CommandName>` for details and examples.

## Testing
Pester unit tests are recommended for validating command functionality.

---

© 2025 Your Name. Licensed under MIT.