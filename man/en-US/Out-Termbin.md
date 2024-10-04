---
external help file: Termbin4PS-help.xml
Module Name: Termbin4PS
online version: https://github.com/rhymeswithmogul/Termbin4PS/blob/main/man/en-US/Out-Termbin.md
schema: 2.0.0
---

# Out-Termbin

## SYNOPSIS
Send some text to Termbin (or any compatible service).

## SYNTAX

```
Out-Termbin [[-InputObject] <String[]>] [-HostName <String>] [-Port <UInt16>] [[-Timeout] <UInt32>]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This cmdlet will take some input and upload it to Termbin.com (or any compatible service) for easy sharing with others.  If successful, it will return a URL pointing to your output.

When using this cmdlet, you more than likely want to pipe your input through Out-String beforehand.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-Process | Out-String | Out-Termbin
https://termbin.com/abc123
```

This will take the output of Get-Process and upload it to Termbin.  If successful, a URL will be returned.

### Example 2
```powershell
PS C:\> Get-Content -Raw 'logfile.txt' | Out-String | Out-Termbin
https://termbin.com/def456
```

This will read the file logfile.txt and upload it to Termbin.  If successful, a URL will be returned.  When using Get-Content, be sure to include the -Raw parameter, as that cmdlet will strip line endings and leave you with barely-legible output.  Alternatively, you may pipe it through Out-String as in the previous example.

### Example 3
```powershell
PS C:\> Get-Content -Raw 'logfile.txt' | Out-String | Out-Termbin -HostName another.termbin.example -Port 9999
https://another.termbin.example/1a2b3c4d
```

This will read the file logfile.txt and upload it to the server, another.termbin.example (port 9999).  If successful, a URL will be returned.

## PARAMETERS

### -Confirm
Prompts you for confirmation before running the cmdlet.  This cmdlet is non-destructive, and will only prompt you if you have set your ConfirmPreference to "Low".

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
One or more strings to send to Termbin (or the specified hostname).

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Timeout
This cmdlet will wait a specified number of milliseconds before returning a failure.  For most people, 30,000 ms (30 s) will be more than enough time.  However, if you are behind a very slow connection, you may want to increase this value.  You may specify any value from 1 ms to 2,147,473,647 ms.  The value 0 will cause this cmdlet to wait forever.

```yaml
Type: UInt32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 30,000
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HostName
By default, this module sends data to Termbin.com.  If there is a compatible third-party service you'd like to use, specify its hostname here.

By using Termbin (or any other server), you agree to its terms of service.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Host, Server, ServerName

Required: False
Position: Named
Default value: termbin.com
Accept pipeline input: False
Accept wildcard characters: False
```

### -Port
Specify the port used to reach the destination server specified by -HostName.  The default Termbin port is 9999.

```yaml
Type: UInt16
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 9999
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]
This cmdlet accepts one or more strings from the pipeline.  They will be joined and sent to the server in one batch.

## OUTPUTS

### System.Uri, if successful;  $null otherwise.
## NOTES
In almost all cases, you will want to pipe this cmdlet's input through Out-String so that it is normalized.  If this cmdlet's input does not have a .ToString() method, you may wind up with a Termbin upload full of class names, or worse.

In the past, this cmdlet was called Send-Termbin.  That alias still works.

## RELATED LINKS

[about_Termbin4PS](about_Termbin4PS)
[Out-String](Out-String)
[Termbin](https://termbin.com)
[GitHub project page:](https://github.com/rhymeswithmogul/Termbin4PS/)