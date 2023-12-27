//%attributes = {}
#DECLARE($labelIds : Collection)->$labelNamesText : Text

$labelNamesText:=""
For each ($id; $labelIds)
	$label:=Form:C1466.labels.query("id=:1"; $id)
	$labelNamesText+=$label.length>0 ? $label.first().name+";" : ""
End for each 
