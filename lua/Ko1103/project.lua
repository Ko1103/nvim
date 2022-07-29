local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end

project.setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      active = true,
      manual_mode = false,
})

local tele_ok, telescope = pcall(require, "telescope")
if not tele_ok then
	return
end

telescope.load_extension("projects")
