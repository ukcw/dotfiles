return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local current_time = os.time()
    local current_hour = tonumber(os.date("%H", current_time))

    local greeting = "Good "

    if current_hour < 12 then
      greeting = greeting .. "morning, Ulysses"
    elseif current_hour < 18 then
      greeting = greeting .. "afternoon, Ulysses"
    else
      greeting = greeting .. "night, Ulysses"
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
