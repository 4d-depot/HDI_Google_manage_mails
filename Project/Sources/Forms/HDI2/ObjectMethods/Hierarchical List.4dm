Case of 
	: (FORM Event:C1606.code=On Selection Change:K2:29)
		
		// init attachments list
		Form:C1466.attachments:=New object:C1471
		// disable the dropdown list 
		OBJECT SET ENABLED:C1123(*; "attachment_DropdownList"; False:C215)
		// disable the download button 
		OBJECT SET ENABLED:C1123(*; "attachment_Button"; False:C215)
		
		StartReceiving
		
	: (FORM Event:C1606.code=On Drop:K2:12)
		If (Form:C1466.trace)
			TRACE:C157
		End if 
		If (Form:C1466.mails.length>0)
			var $destinationLabel; $status : Object
			var $id : Text
			
			// search the box information of the destination box
			$destinationLabel:=FindDestinationLabel
			
			// ids of the email to copy
			$id:=Form:C1466.mail.id
			
			If ($destinationLabel#Null:C1517)
				If (Form:C1466.share)
					// add the destination label to the selected mail 
					$status:=cs:C1710.NetKit.Google.new(Form:C1466.OAuth2Provider).mail.update([$id]; {addLabelIds: New collection:C1472($destinationLabel.id)})
					
				Else 
					// add the destination label to the selected mail and remove the current label
					$status:=cs:C1710.NetKit.Google.new(Form:C1466.OAuth2Provider).mail.update([$id]; {addLabelIds: New collection:C1472($destinationLabel.id); removeLabelIds: New collection:C1472(Form:C1466.currentlabel.id)})
					
				End if 
				
				
				If ($status.success)
					var $listID : Integer
					ARRAY INTEGER:C220($arr; 0)
					//  update the email of the selected mailbox
					StartReceiving
					
				Else 
					ALERT:C41($status.statusText)
				End if 
				
			End if 
		End if 
End case 