<#
	Termbin4ps.psd1, module manifest for the Termbin4PS module
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

@{

# Script module or binary module file associated with this manifest.
RootModule = 'Termbin4PS.psm1'

# Version number of this module.
ModuleVersion = '2.0.0'

# Supported PSEditions
CompatiblePSEditions = @('Desktop', 'Core')

# ID used to uniquely identify this module
GUID = '1b8e61a7-aba7-4966-a6b8-047c09679206'

# Author of this module
Author = 'Colin Cogle <colin@colincogle.name>'

# Copyright statement for this module
Copyright = '(c) 2020-2024 Colin Cogle.  Licensed under AGPLv3.  All rights reserved.'

# Description of the functionality provided by this module
Description = 'A PowerShell module for piping output to Termbin.'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @('Out-Termbin')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = ''

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @('Send-Termbin')

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = @(
	'en-US/about_Termbin4PS.help.txt',
	'en-US/Termbin4PS-help.xml',
	'AUTHORS.txt',
	'ChangeLog.txt',
	'LICENSE.md',
	'NEWS.md',
	'README.md',
	'SECURITY.md',
	'Termbin4PS.psd1',
	'Termbin4PS.psm1',
	'Termbin4PS.Tests.ps1'
)

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

	PSData = @{

		# Tags applied to this module. These help with module discovery in online galleries.
		Tags = @('termbin', 'share', 'terminal', 'output', 'fiche')

		# A URL to the license for this module.
		LicenseUri = 'https://www.gnu.org/licenses/agpl-3.0.en.html'

		# A URL to the main website for this project.
		ProjectUri = 'https://github.com/rhymeswithmogul/Termbin4PS'

		# A URL to an icon representing this module.
		# IconUri = ''

		# ReleaseNotes of this module
		ReleaseNotes = 'https://github.com/rhymeswithmogul/Termbin4PS/blob/main/NEWS'

		# Prerelease string of this module
		Prerelease = ''

		# Flag to indicate whether the module requires explicit user acceptance for install/update/save
		RequireLicenseAcceptance = $false

		# External dependent modules of this module
		# ExternalModuleDependencies = @()

	} # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

