# Termbin4PS

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/f136d39acc914277bc1db3f6c85c6906)](https://app.codacy.com/gh/rhymeswithmogul/Termbin4PS?utm_source=github.com\&utm_medium=referral\&utm_content=rhymeswithmogul/Termbin4PS\&utm_campaign=Badge_Grade_Settings) [![PowerShell Gallery Version (including pre-releases)](https://img.shields.io/powershellgallery/v/Termbin4PS?include_prereleases)](https://powershellgallery.com/packages/Termbin4PS/) [![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/Termbin4PS)](https://powershellgallery.com/packages/Termbin4PS/)

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

## Using Termbin-compatible Services

If Termbin ever shuts down, don't worry;  you can use this module with compatible services.

```powershell
PS C:\> Get-Process | Out-String | Out-Termbin -HostName another.termbin.example -Port 9999
```
