-- username in header
Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ui.Line {}
	end
	return ui.Line {
		ui.Span(ya.user_name()):fg("blue"),
		ui.Span("@"),
		ui.Span(ya.host_name()):fg("magenta"),
		ui.Span(":"),
	}
end, 500, Header.LEFT)
