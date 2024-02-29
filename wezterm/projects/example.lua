local function startup(wezterm)
	local mux = wezterm.mux
	local project_dir = wezterm.home_dir .. "/dev/"

	local tab, main_pane, window = mux.spawn_window({
		cwd = project_dir,
	})
end

return {
	startup = startup,
}
