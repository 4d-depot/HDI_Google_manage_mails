Class constructor($OAuth2Provider : cs:C1710.NetKit.OAuth2Provider)
	
	// List of labels returned by the server
	This:C1470._labels:=New collection:C1472
	This:C1470.OAuth2Provider:=$OAuth2Provider
	
	// Creation of a list to display the label name in a hierarchical list
Function createList()
	var $count : Integer
	var $label : Text
	var $root; $currentLvl; $labelInfo : Object
	var $split : Collection
	
	// Gets the label collection directly under the root label.
	This:C1470._labels:=cs:C1710.NetKit.Google.new(This:C1470.OAuth2Provider).mail.getLabelList()
	
	If (This:C1470._labels.success)
		$count:=0
		$root:={subListID: New list:C375}
		For each ($labelInfo; This:C1470._labels.labels)
			$split:=Split string:C1554($labelInfo.name; "/")
			$currentLvl:=$root
			For each ($label; $split)
				// check if label already exist
				If ($currentLvl[$label]=Null:C1517)
					
					// check if sublist creation is required
					If ($currentLvl.subListID=Null:C1517)
						$currentLvl.subListID:=New list:C375
						SET LIST ITEM:C385($currentLvl.listID; $currentLvl.count; $currentLvl.name; $currentLvl.count; $currentLvl.subListID; False:C215)
					End if 
					
					// add the new label to the list
					$currentLvl[$label]:={name: $label; count: $count; listID: $currentLvl.subListID}
					
					APPEND TO LIST:C376($currentLvl.subListID; $label; $count)
					$labelInfo.listID:=$count
					$count+=1
				End if 
				$currentLvl:=$currentLvl[$label]
				If ($split.last()=$label)
					$currentLvl.id:=$labelInfo.id
				End if 
				
			End for each 
		End for each 
		
		This:C1470.listRef:=$root.subListID
	End if 
	
	// Search label information according to the hierarchical list Id
Function search($listID : Integer) : Object
	
	var $labels : Collection
	
	// search bi listId in the _labels collection
	$labels:=This:C1470._labels.labels.query("listID=:1"; $listID)
	
	If ($labels.length=0)
		return Null:C1517
	Else 
		return $labels[0]
	End if 
	
	
	
	