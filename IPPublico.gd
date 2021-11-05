extends LineEdit


func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	show()
	self.text = json.result['ip']

func _on_ButtonIP_pressed():
	$HTTPRequest.request("https://api.ipify.org/?format=json")
