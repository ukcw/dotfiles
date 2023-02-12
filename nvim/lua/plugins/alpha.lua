return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local current_time = os.time()
    local current_hour = tonumber(os.date("%H", current_time))

    local greeting = ""

    if current_hour < 12 then
      greeting = greeting .. "  Good morning, Ulysses"
    elseif current_hour < 18 then
      greeting = greeting .. "  Good afternoon, Ulysses"
    elseif current_hour < 21 then
      greeting = greeting .. "  Good evening, Ulysses"
    else
      greeting = greeting .. "  Good night, Ulysses"
    end

    local logo = [[
	  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
	  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
	  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
	  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
	  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
	  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

                %s
    ]]
    logo = string.format(logo, greeting)
    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
