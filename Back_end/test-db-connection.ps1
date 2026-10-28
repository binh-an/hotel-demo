# Test ket noi SQL Server bang connection string trong appsettings.json
# Chay: powershell -File .\test-db-connection.ps1
$config = Get-Content "$PSScriptRoot\appsettings.json" -Raw | ConvertFrom-Json
$connStr = $config.ConnectionStrings.DefaultConnection

$conn = New-Object System.Data.SqlClient.SqlConnection($connStr)
try {
    $conn.Open()
    Write-Host "KET NOI THANH CONG - Server: $($conn.DataSource), Database: $($conn.Database)" -ForegroundColor Green
} catch {
    Write-Host "KET NOI THAT BAI: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
} finally {
    $conn.Dispose()
}
