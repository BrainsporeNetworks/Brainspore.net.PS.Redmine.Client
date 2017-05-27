# 
# Copyright 2017 Jacob "Sunrunner20" Carrell
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

function Connect-Server {
<#
.SYNOPSIS
Performs a login to a Redmine server.

.DESCRIPTION
Performs a login to a Redmine server. 

This is the first Cmdlet to be executed and required for all other Cmdlets of this module. It creates a reference to redmine server.

If logging in via API key a password must still be supplied, but can be any value. The API key then becomes the user name.

.OUTPUTS
This Cmdlet returns a [net.Brainspore.CS.Redmine.Client.RedmineClient] with a references to a redmine server. On failure it returns $null.

.INPUTS
See PARAMETER section for a description of input parameters.

.EXAMPLE
# Performs a login to a redmine server via API key

PS > [Uri] $ServerBaseUri = 'https://www.example.com'
PS > [string] $BaseUrl = "/";
PS > $TotalAttempts = 3;
PS > $BaseRetryIntervallMilliseconds = 50;
PS > $username = "arbitrary-api-key";
PS > $password = "arbitrary-password" | ConvertTo-SecureString -AsPlainText -Force;
PS > $Credential = New-Object System.Management.Automation.PSCredential($username, $password);
PS > $redmine = Connect-Server $ServerBaseUri $BaseUrl -Credential $Credential -TotalAttempts $TotalAttempts -BaseRetryIntervallMilliseconds $BaseRetryIntervallMilliseconds;
PS > $redmine
TotalAttempts                  : 3
BaseRetryIntervallMilliseconds : 50
RedmineUrl                     : https://www.example.com/
Username                       : arbitrary-api-key
Password                       : System.Security.SecureString
IsLoggedIn                     : True
PageSize                       : 100

PS > $redmine.GetType().FullName
net.Brainspore.CS.Redmine.Client.RedmineClient

.LINK
Online Version: http://dfch.biz/biz/dfch/PS/Redmine/Client/Connect-Server/

.NOTES
See module manifest for required software versions and dependencies at: 
http://dfch.biz/biz/dfch/PS/Redmine/Client/net.Brainspore.PS.Redmine.Client.psd1/
#>

[CmdletBinding(
	HelpURI = 'http://dfch.biz/biz/dfch/PS/Redmine/Client/Connect-Server/'
)]
Param 
(
	# [Optional] The ServerBaseUri such as 'https://redmine/'. 
	# Default is as specified in the module configuration file.
	[Parameter(Mandatory = $false, Position = 0)]
	[Uri] $ServerBaseUri = (Get-Variable -Name $MyInvocation.MyCommand.Module.PrivateData.MODULEVAR -ValueOnly).ServerBaseUri
	, 
	# [Optional] The BaseUrl such as '/redmine/'. 
	# Default is as specified in the module configuration file.
	[Parameter(Mandatory = $false, Position = 1)]
	[string] $BaseUrl = (Get-Variable -Name $MyInvocation.MyCommand.Module.PrivateData.MODULEVAR -ValueOnly).BaseUrl
	, 
	# Encrypted credentials as [System.Management.Automation.PSCredential] with 
	# which to perform login. 
	# Default is as specified in the module configuration file.
	[Parameter(Mandatory = $false, Position = 2)]
	[alias("cred")]
	$Credential = (Get-Variable -Name $MyInvocation.MyCommand.Module.PrivateData.MODULEVAR -ValueOnly).Credential
	,
	# [Optional] Specifies the total number of attempts a request shall be 
	# retried before raising an error. 
	# Default is as specified in the module configuration file.
	[Parameter(Mandatory = $false)]
	$TotalAttempts = (Get-Variable -Name $MyInvocation.MyCommand.Module.PrivateData.MODULEVAR -ValueOnly).TotalAttempts
	,
	# [Optional] Specifies the base time that is used for retrying operations 
	# in case an error occurred. 
	# Default is as specified in the module configuration file.
	[Parameter(Mandatory = $false)]
	$BaseRetryIntervallMilliseconds = (Get-Variable -Name $MyInvocation.MyCommand.Module.PrivateData.MODULEVAR -ValueOnly).BaseRetryIntervallMilliseconds
)

BEGIN 
{
	trap { Log-Exception $_; break; }

	$datBegin = [datetime]::Now;
	[string] $fn = $MyInvocation.MyCommand.Name;
	Log-Debug $fn ("CALL. ServerBaseUri '{0}'; BaseUrl '{1}'; Username '{2}'" -f $ServerBaseUri.AbsoluteUri, $BaseUrl, $Credential.Username ) -fac 1;
}
# BEGIN 

PROCESS
{
	trap { Log-Exception $_; break; }
	
	$client = New-Object net.Brainspore.CS.Redmine.Client.RedmineClient;
	Contract-Assert ($client -is [net.Brainspore.CS.Redmine.Client.RedmineClient])
	
	[Uri] $uri = '{0}/{1}' -f $ServerBaseUri.AbsoluteUri.TrimEnd('/'), $BaseUrl.Trim('/');
	Contract-Assert ($uri.IsAbsoluteUri)
	
	$isLoginSuccessful = $client.Login($uri, $Credential.UserName, $Credential.Password, $TotalAttempts, $BaseRetryIntervallMilliseconds);
	Contract-Assert ($isLoginSuccessful)
	
	(Get-Variable -Name $MyInvocation.MyCommand.Module.PrivateData.MODULEVAR -ValueOnly).Client = $client;
	
	$OutputParameter = $client;
}
# PROCESS

END 
{
	trap { Log-Exception $_; break; }

	$datEnd = [datetime]::Now;
	Log-Debug -fn $fn -msg ("RET. fReturn: [{0}]. Execution time: [{1}]ms. Started: [{2}]." -f $fReturn, ($datEnd - $datBegin).TotalMilliseconds, $datBegin.ToString('yyyy-MM-dd HH:mm:ss.fffzzz')) -fac 2;
	
	return $OutputParameter;
}
# END

} # function

Set-Alias -Name Connect- -Value 'Connect-Server';
Set-Alias -Name Enter- -Value 'Connect-Server';
if($MyInvocation.ScriptName) { Export-ModuleMember -Function Connect-Server -Alias Connect-, Enter-; }


