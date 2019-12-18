extends RichTextLabel

func add_line(text: String) -> void:
	bbcode_text = bbcode_text.insert(bbcode_text.length(), "\n" + text)