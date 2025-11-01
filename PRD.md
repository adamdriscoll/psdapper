Update the PowerShell cmdlets to use Dapper for database operations instead of raw ADO.NET commands.

To integrate Dapper into the PowerShell cmdlets for database operations, you will need to modify the existing cmdlets to utilize Dapper's methods for executing SQL commands and queries. Below are examples of how you can implement this in your PowerShell module.Dapper is a lightweight ORM (Object-Relational Mapper) for .NET that simplifies data access by providing extension methods for IDbConnection.

Consider the following examples when updating the psdapper.psm1 file.

```csharp
// insert/update/delete etc
var count  = connection.Execute(sql [, args]);

// multi-row query
IEnumerable<T> rows = connection.Query<T>(sql [, args]);

// single-row query ({Single|First}[OrDefault])
T row = connection.QuerySingle<T>(sql [, args]);
```

For example, selecting data would look like this:

```csharp
var rows = connection.Query("select 1 A, 2 B union all select 3, 4").AsList();

Assert.Equal(1, (int)rows[0].A);
Assert.Equal(2, (int)rows[0].B);
Assert.Equal(3, (int)rows[1].A);
Assert.Equal(4, (int)rows[1].B);
```

Executing commands with parameters:

```csharp
var count = connection.Execute(@"
  set nocount on
  create table #t(i int)
  set nocount off
  insert #t
  select @a a union all select @b
  set nocount on
  drop table #t", new {a=1, b=2 });
Assert.Equal(2, count);
```

```csharp
var count = connection.Execute(@"insert MyTable(colA, colB) values (@a, @b)",
    new[] { new { a=1, b=1 }, new { a=2, b=2 }, new { a=3, b=3 } }
  );
Assert.Equal(3, count); // 3 rows inserted: "1,1", "2,2" and "3,3"
```
