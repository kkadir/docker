# https://blogs.technet.microsoft.com/heyscriptingguy/2013/06/25/use-powershell-to-interact-with-the-windows-api-part-1/
$src = '[DllImport("advapi32.dll", SetLastError = true, BestFitMapping = false, ThrowOnUnmappableChar = true)]
		[return: MarshalAs(UnmanagedType.Bool)] 
		public static extern bool LogonUser(
		   [MarshalAs(UnmanagedType.LPStr)] string pszUserName,
		   [MarshalAs(UnmanagedType.LPStr)] string pszDomain,
		   [MarshalAs(UnmanagedType.LPStr)] string pszPassword,
		   int dwLogonType,
		   int dwLogonProvider,
		   ref IntPtr phToken);';
$advapi32 = Add-Type -MemberDefinition $src -Name 'Advapi32' -Namespace 'Win32' -PassThru;
$fake = 0;
$LOGON32_LOGON_NEW_CREDENTIALS = 9;
$LOGON32_LOGON_INTERACTIVE = 2;
$LOGON32_PROVIDER_DEFAULT = 0;
$LOGON32_PROVIDER_WINNT50 = 3;
$advapi32::LogonUser('svcAppPoolDocker-ACC', 'aesua.local', '&xgfMQPcmdye@!', $LOGON32_LOGON_INTERACTIVE, $LOGON32_PROVIDER_DEFAULT, [ref] $fake);
# http://stackoverflow.com/questions/2916359/logonuser-using-logon32-logon-new-credentials-works-against-remote-untrusted-dom
$advapi32::LogonUser('svcAppPoolDocker-ACC', 'aesua.local', '&xgfMQPcmdye@!', $LOGON32_LOGON_NEW_CREDENTIALS, $LOGON32_PROVIDER_WINNT50, [ref] $fake);
