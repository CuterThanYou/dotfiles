-- username in header
Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ui.Line {}
	end
	return ui.Line {
		ui.Span(ya.user_name()):fg("magenta"),
		ui.Span("@"),
		ui.Span(ya.host_name()):fg("magenta"),
		ui.Span(":"),
	}
end, 500, Header.LEFT)

-- show user and group
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ui.Line {}
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		ui.Span(":"),
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		ui.Span(" "),
	}
end, 500, Status.RIGHT)

-- cross instance yank
require("session"):setup {
	sync_yanked = true,
}
