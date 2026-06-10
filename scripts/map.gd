extends TextureRect
class_name MapUI

# Zmienna przechowująca referencję do kartki, która aktualnie czeka na lokację
var current_paper_waiting : WritingQuest

func open_for_paper(paper : WritingQuest):
	current_paper_waiting = paper
	show() # Pokazujemy mapę

# Tę funkcję podpinasz pod każdy przycisk lokacji na mapie 
# (np. przycisk Lasu wysyła "Mroczny Las", przycisk Jaskini wysyła "Wilcza Jaskinia" itp.)
func _on_location_selected(location_name : String):
	if current_paper_waiting != null:
		# Wpisujemy wybraną lokację bezpośrednio na kartkę
		current_paper_waiting.set_location_text(location_name)
		
	# Czyścimy referencję i chowamy mapę
	current_paper_waiting = null
	hide()
