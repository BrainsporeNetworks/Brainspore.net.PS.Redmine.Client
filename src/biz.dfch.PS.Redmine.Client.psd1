#
# Module manifest for module 'biz.dfch.PS.Redmine.Client'
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'biz.dfch.PS.Redmine.Client.psm1'

# Version number of this module.
ModuleVersion = '1.0.0.20160701'

# ID used to uniquely identify this module
GUID = 'b6e1bf9e-e92c-40b8-8845-df1294c8e5a4'

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
	'biz.dfch.PS.System.Logging'
	,
	'biz.dfch.PS.System.Utilities'
)

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @(
	'biz.dfch.CS.Redmine.Client.dll'
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
	'Enter-Server.ps1'
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
	'biz.dfch.CS.Redmine.Client.dll'
	,
	'biz.dfch.PS.Redmine.Client.xml'
	,
	'Import-Module.ps1'
)

# Private data to pass to the module specified in RootModule/ModuleToProcess
PrivateData = @{
	"MODULEVAR" = "biz_dfch_PS_Redmine_Client"
}

# HelpInfo URI of this module
HelpInfoURI = 'http://dfch.biz/biz/dfch/PS/Redmine/Client/'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
DefaultCommandPrefix = 'Redmine'

}

# 
# Copyright 2016 d-fens GmbH
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
