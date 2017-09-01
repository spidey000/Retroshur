MCRC=892EB696
MVersion=1.0.0

;Loading shader json config
If FileExist(RLMediaPath . "\Shaders\" . shaderName . "\" . shaderName . ".json"){
	shaderObj := {}
	shaderObj := JSON_load(RLMediaPath . "\Shaders\" . shaderName . "\" . shaderName . ".json")	
	Log(A_ThisFunc . " - Loading shader configuration found at: " . RLMediaPath . "\Shaders\" . shaderName . "\" . shaderName . ".json")
}
