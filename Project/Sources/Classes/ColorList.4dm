Class constructor
	// Colors allowed by Gmail
	This:C1470.colors:=["#000000"; "#04502e"; "#076239"; "#094228"; "#0b4f30"; "#0b804b"; "#0d3472"; "#0d3b44"; "#149e60"; "#16a765"; "#16a766"; "#1a764d"; "#1c4587"; "#285bac"; "#2a9c68"; "#2da2bb"; "#3c78d8"; "#3d188e"; "#3dc789"; "#41236d"; "#42d692"; "#434343"; "#43d692"; "#44b984"; "#464646"; "#4986e7"; "#4a86e8"; "#594c05"; "#653e9b"; "#662e37"; "#666666"; "#684e07"; "#68dfa9"; "#6d9eeb"; "#711a36"; "#7a2e0b"; "#7a4706"; "#822111"; "#83334c"; "#89d3b2"; "#8a1c0a"; "#8e63ce"; "#98d7e4"; "#994a64"; "#999999"; "#a0eac9"; "#a2dcc1"; "#a46a21"; "#a479e2"; "#a4c2f4"; "#aa8831"; "#ac2b16"; "#b3efd3"; "#b65775"; "#b694e8"; "#b6cff5"; "#b99aff"; "#b9e4d0"; "#c2c2c2"; "#c6f3de"; "#c9daf8"; "#cc3a21"; "#cca6ac"; "#cccccc"; "#cf8933"; "#d0bcf1"; "#d5ae49"; "#e07798"; "#e3d7ff"; "#e4d7f5"; "#e66550"; "#e7e7e7"; "#eaa041"; "#ebdbde"; "#efa093"; "#efefef"; "#f2b2a8"; "#f2c960"; "#f3f3f3"; "#f691b2"; "#f691b3"; "#f6c5be"; "#f7a7c0"; "#fad165"; "#fb4c2f"; "#fbc8d9"; "#fbd3e0"; "#fbe983"; "#fcda83"; "#fcdee8"; "#fce8b3"; "#fdedc1"; "#fef1d1"; "#ff7537"; "#ffad46"; "#ffad47"; "#ffbc6b"; "#ffc8af"; "#ffd6a2"; "#ffdeb5"; "#ffe6c7"; "#ffffff"]
	
Function getHexa($id : Integer) : Text
	
	If (($id>0) && ($id<=This:C1470.colors.length))
		return This:C1470.colors[$id-1]
	End if 
	
	return ""
	
Function getIndex($hexa : Text) : Integer
	
	return This:C1470.colors.indexOf($hexa)+1