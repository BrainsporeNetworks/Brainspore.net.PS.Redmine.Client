#
# Module manifest for module 'net.Brainspore.PS.Redmine.Client'
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'net.Brainspore.PS.Redmine.Client.psm1'

# Version number of this module.
ModuleVersion = '2.0.2.20160717'

# ID used to uniquely identify this module
GUID = 'bdcc3303-6c3d-4b99-a5ff-9f68967aadd1'

# Author of this module
Author = 'Ronald Rink'

# Company or vendor of this module
CompanyName = 'd-fens GmbH'

# Copyright statement for this module
Copyright = '(c) 2016 d-fens GmbH. Distributed under Apache 2.0 license.'

# Description of the functionality provided by this module
Description = 'PowerShell module for Redmine Project Management'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of the .NET Framework required by this module
DotNetFrameworkVersion = '4.5'

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(
	'net.Brainspore.PS.System.Logging'
	,
	'net.Brainspore.PS.System.Utilities'
)

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
ScriptsToProcess = @(
	'Import-Module.ps1'
)

# ModuleToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @(
	'Connect-Server.ps1'
)

# Functions to export from this module
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = '*'

# List of all modules packaged with this module.
# ModuleList = @()

# List of all files packaged with this module
FileList = @(
	'LICENSE'
	,
	'NOTICE'
	,
	'README.md'
	,
	'net.Brainspore.PS.Redmine.Client.xml'
	,
	'Import-Module.ps1'
	,
	'net.Brainspore.CS.System.Utilities.dll'
	
)

# Private data to pass to the module specified in RootModule/ModuleToProcess
PrivateData = @{

	PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'dfch', 'PowerShell', 'Redmine', 'Client'
		
        # A URL to the license for this module.
        LicenseUri = 'https://github.com/dfensgmbh/net.Brainspore.PS.Redmine.Client/blob/master/LICENSE'
		
        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/dfensgmbh/net.Brainspore.PS.Redmine.Client.git'
		
        # A URL to an icon representing this module.
        IconUri = 'https://raw.githubusercontent.com/dfensgmbh/net.Brainspore.PS.Redmine.Client/master/logo-32x32.png'
		
        # ReleaseNotes of this module
        ReleaseNotes = '20160717
Features

* updated redmine-net-api library to 4.5.1 (instead of 4.5) after upgrade of net.Brainspore.CS.Redmine.Client to .NET 4.6 (from 4.5)
	* this is a breaking change as the namespace in redmine 4.5.1 changed (especially `Exceptions`)
* to fix an SSL security issue in the redmine-api.1.0.4 this module uses an updated net.Brainspore.CS.Redmine.Client library that works around this issue
	* therefore we have a breaking change (from a SemVer perspective)
	* now the SecurityProtocol can be set by [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12 from PowerShell

Bugfixes

* added missing reference to redmine 4.5.1 assembly in PSD1
'

    }

	"MODULEVAR" = "biz_dfch_PS_Redmine_Client"
}

# HelpInfo URI of this module
HelpInfoURI = 'http://dfch.biz/biz/dfch/PS/Redmine/Client/'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
DefaultCommandPrefix = 'Redmine'

}

# 
# Copyright 2017 Jaob "Sunrunner20" Carrell
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 