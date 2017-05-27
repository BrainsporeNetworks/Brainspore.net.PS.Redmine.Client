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

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")

function Stop-Pester($message = "EMERGENCY: Script cannot continue.")
{
	$msg = $message;
	$e = New-CustomErrorRecord -msg $msg -cat OperationStopped -o $msg;
	$PSCmdlet.ThrowTerminatingError($e);
}

Describe -Tags "Enter-Server.Tests" "Enter-Server.Tests" {

	Mock Export-ModuleMember { return $null; }

	Context "Enter-Server-Succeeds" {
	
		# Context wide constants
		
		BeforeEach {
			# N/A
		}

		It "Warmup" -Test {
			1 | Should Be 1;
		}
	
		It "Sut-Exists" -Test {
		
			Test-Path -Path $sut | Should Be $true;
		}
		
		It "Enter-Server-WithApiKey-Succeeds" -Test {
		
			[Uri] $ServerBaseUri = 'https://rhel7-t6-01.tenant6.local'
			[string] $BaseUrl = "/"

			$username = "arbitrary-username";
			$password = "arbitrary-password" | ConvertTo-SecureString -AsPlainText -Force;
			$Credential = New-Object System.Management.Automation.PSCredential($username, $password);

			$TotalAttempts = 2
			$BaseRetryIntervallMilliseconds = 50
			
			$result = Enter-Server $ServerBaseUri $BaseUrl -Credential $Credential -TotalAttempts $TotalAttempts -BaseRetryIntervallMilliseconds $BaseRetryIntervallMilliseconds;
			
			$result | Should Not Be $null;
			$client -is [net.Brainspore.CS.Redmine.Client.RedmineClient] | Should Be $true;
		}
	}

}

