<#
    Termbin4ps.Tests.ps1, tests for the Termbin4PS module
    Copyright (C) 2020-2021 Colin Cogle
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

Context 'Validate the module files' {
    BeforeAll {
        $dir      = Split-Path -Parent $PSCommandPath
        $psm1File = Join-Path -Path $dir -ChildPath 'Termbin4PS.psm1'

        $enUSHelpFolder = Join-Path -Path $dir -ChildPath 'en-US'
        $ModuleHelpFile = Join-Path -Path $enUSHelpFolder -ChildPath 'Termbin4PS-help.xml'
    }
    It 'has a module manifest' {
        Join-Path -Path $dir -ChildPath 'Termbin4PS.psd1' | Should -Exist
    }
    It 'has a root module' {
        $psm1File | Should -Exist
    }
    It 'has a valid root module' {
        $code = Get-Content -Path $psm1File -ErrorAction Stop
        $errors = $null
        $null = [Management.Automation.PSParser]::Tokenize($code, [ref]$errors)
        $errors.Count | Should -Be 0
    }
    It 'has a conceptual help file' {
        Join-Path -Path $enUSHelpFolder -ChildPath 'about_Termbin4PS.help.txt' | Should -Exist
    }
    It 'has a module help file' {
        $ModuleHelpFile | Should -Exist
    }
    It 'has a valid module help file' {
        $code = [Xml](Get-Content -Path $ModuleHelpFile -ErrorAction Stop)
        $code.Count | Should -Be 1
    }
}

Describe 'Out-Termbin' {
    BeforeAll {
        $psd1File = Join-Path -Path (Split-Path -Parent $PSCommandPath) -ChildPath 'Termbin4PS.psd1'
        Import-Module -Name $psd1File
        
        $TestString = 'This is a Pester test.'
    }
    It 'Returns a URL on success' {
        $TestString | Out-Termbin | Should -BeLike 'https://termbin.com/*'
    }
    It 'Returns nothing when the timeout is exceeded' {
        $TestString | Out-Termbin -Timeout 1 -ErrorAction SilentlyContinue | Should -Be ''
    }
}

AfterAll {
    Remove-Module -Name 'Termbin4PS' -Force
}