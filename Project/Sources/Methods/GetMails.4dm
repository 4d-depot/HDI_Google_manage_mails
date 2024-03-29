//%attributes = {}
#DECLARE($OAuth2Provider : cs:C1710.NetKit.OAuth2Provider; $param : Object; $winRef : Integer)
// Download the emails according the $param
// $OAuth2Provider -> Provider for the connection to the server 
// $param -> Parameters for the NetKit getmails function
// $winRef -> Ref of the caller worker 

var $mailIds:=[]
var $mails:=[]
var $mailId : Object
var $google : cs:C1710.NetKit.Google

$google:=cs:C1710.NetKit.Google.new($OAuth2Provider)

// downloads the emails
$mailIds:=$google.mail.getMailIds($param).mailIds

If ($mailIds.length>0)
	$mails:=$google.mail.getMails($mailIds)
End if 

// Returns the formula to the mail process
CALL FORM:C1391($winRef; Formula:C1597(Form:C1466.mails:=$mails))

// Returns the OAuth2Provider with the updated token to the main process
CALL FORM:C1391($winRef; Formula:C1597(Form:C1466.OAuth2Provider:=$OAuth2Provider))

// Hides the spinner
CALL FORM:C1391($winRef; Formula:C1597(OBJECT SET VISIBLE:C603(*; "Spinner"; False:C215)))
