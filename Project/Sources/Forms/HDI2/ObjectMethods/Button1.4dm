Form:C1466.OAuth2Provider:=SignedInProvider
Form:C1466.OAuth2Provider.getToken()

OBJECT SET VISIBLE:C603(*; "Spinner1"; True:C214)

// Start the authentication and the creation of the label list
CALL WORKER:C1389("myWorker"; Formula:C1597(GetLabels); Form:C1466.OAuth2Provider; Current form window:C827)

ShowBoxInfo(True:C214)

