<#
    Termbin4ps.psd1, code for the Termbin4PS module
    Copyright (C) 2020-2024 Colin Cogle
    Online at <https://github.com/rhymeswithmogul/Termbin4PS>

    This program is free software: you can redistribute it and/or modify it
    under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or (at your
    option) any later version.

    This program is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY;  without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License
    for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#>

#Requires -Version 5.0

Function Out-Termbin
{
	[CmdletBinding(SupportsShouldProcess, ConfirmImpact='Low')]
	[OutputType([Uri])]
	[Alias('Send-Termbin')]
	Param(
		[Parameter(Position=0, ValueFromPipeline)]
		[String[]] $InputObject,

		[Alias('Host', 'Server', 'ServerName')]
		[ValidateNotNullOrEmpty()]
		[String] $HostName = 'termbin.com',

		[ValidateRange(1,65535)]
		[UInt16] $Port = '9999',

		[UInt32] $Timeout = 30000	# milliseconds
	)

	Begin {
		# This will be sent to Termbin.
		$toSend = [Text.StringBuilder]::new()
	}
	
	Process {
		# Take each line of pipeline input and append it to our string to send.
		ForEach ($line in $InputObject) {
			Write-Debug "Preparing to send $($line.Length) more characters."
			$null = $toSend.AppendLine($line)
		}
	}

	End {
		If ($PSCmdlet.ShouldProcess(
			"Upload a $($toSend.Length)-character string to ${HostName}:$Port.",
			"${HostName}:$Port",
			"Upload a $($toSend.Length)-character string"
		)) {
			Try {
				Write-Debug "Opening a socket to ${HostName}:$Port"
				$socket = [Net.Sockets.TcpClient]::new($HostName, $Port)
				Write-Debug "Setting timeouts to $Timeout milliseconds"
				$socket.SendTimeout = $Timeout
				$socket.ReceiveTimeout = $Timeout
				$stream = $socket.GetStream()

				Write-Debug "Sending $($toSend.Length) characters to $HostName"
				$writer = [IO.StreamWriter]::new($stream)
				$writer.WriteLine($toSend.ToString())
				$writer.Flush()

				Write-Debug "Receiving the URL from $HostName"
				$bufferSize = 1024
				$buffer = New-Object -TypeName Byte[] -ArgumentList $bufferSize
				$read = $stream.Read($buffer, 0, $bufferSize)
			}
			Catch [IO.IOException] {
				Write-Error "Could not connect to ${HostName}:$Port within $($Timeout / 1000) seconds."
			}
			Finally {
				Write-Debug 'Disposing of the stream objects'
				If ($null -ne $writer) {
					$writer.Close()
				}
				If ($null -ne $stream) {
					$stream.Close()
				}
			}
			
			Write-Debug 'Encoding the URL and showing it to the user'
			Return ([Text.ASCIIEncoding]::new()).GetString($buffer, 0, $read)
		}
	}
}