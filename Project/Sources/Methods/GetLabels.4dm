//%attributes = {}
#DECLARE($OAuth2Provider : cs:C1710.NetKit.OAuth2Provider; $winRef : Integer)
// Creates the hierarchical list of labels
// $OAuth2Provider -> Provider for the connection to the server 
// $winRef -> Ref of the caller worker 

var $labels : cs:C1710.Labels

$labels:=cs:C1710.Labels.new($OAuth2Provider)

// Download and display the label list
$labels.createList()

// Save the OAuth2Provider with the updated token in the main process
CALL FORM:C1391($winRef; Formula:C1597(Form:C1466.OAuth2Provider:=$OAuth2Provider))
// Set the label list in the main process
CALL FORM:C1391($winRef; Formula:C1597(Form:C1466.labels:=$labels))

// Hide the spinner
CALL FORM:C1391($winRef; Formula:C1597(OBJECT SET VISIBLE:C603(*; "Spinner1"; False:C215)))