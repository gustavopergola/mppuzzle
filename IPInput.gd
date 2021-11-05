extends LineEdit

var initialText = "IP ADDRESS (NO PORT)"

func _ready():
	setIninitalText()


func _on_IPInput_focus_entered():
	self.text = ''


func _on_IPInput_focus_exited():
	setIninitalText()
		
func setIninitalText():
	if self.text == '': 
		self.text = initialText
