# Termbin4PS
Native [Termbin](https://termbin.com) support for PowerShell!

## Example
To send a log file to Termbin, simply pipe the raw content to `Out-Termbin`:

```powershell
PS C:\> Get-Content -Raw 'logfile.txt' | Out-Termbin
https://termbin.com/1a2b
```

Note that you need to use `Get-Content -Raw` so that line endings are not stripped.

## Another Example
To send a process list to Termbin, simply pipe your command through `Out-String` on its way to `Out-Termbin`:

```powershell
PS C:\> Get-Process | Out-String | Out-Termbin
```

In most cases, you will need to pass your output through PowerShell's `Out-String` so that PowerShell will convert the native .NET objects into simple strings.