local M = {}

M.config = function()
	require('vgit').setup({
		keymaps = {
			['n <leader>S'] = 'buffer_hunk_stage',
			['n <leader>X'] = 'buffer_hunk_reset',
			['n <leader>gs'] = 'buffer_hunk_preview',
			-- ['n <leader>gb'] = 'buffer_blame_preview',
			['n <leader>gd'] = 'buffer_diff_preview',
			['n <leader>gh'] = 'buffer_history_preview',
			['n <leader>gq'] = 'project_hunks_qf',
			['n <leader>gx'] = 'toggle_diff_preference',
		},
		settings = {
			live_blame = {
				enabled = false,
				format = function(blame, git_config)
					local config_author = git_config['user.name']
					local author = blame.author
					if config_author == author then
						author = 'You'
					end
					local time = os.difftime(os.time(), blame.author_time)
							/ (60 * 60 * 24 * 30 * 12)
					local time_divisions = {
						{ 1, 'years' },
						{ 12, 'months' },
						{ 30, 'days' },
						{ 24, 'hours' },
						{ 60, 'minutes' },
						{ 60, 'seconds' },
					}
					local counter = 1
					local time_division = time_divisions[counter]
					local time_boundary = time_division[1]
					local time_postfix = time_division[2]
					while time < 1 and counter ~= #time_divisions do
						time_division = time_divisions[counter]
						time_boundary = time_division[1]
						time_postfix = time_division[2]
						time = time * time_boundary
						counter = counter + 1
					end
					local commit_message = blame.commit_message
					if not blame.committed then
						author = 'You'
						commit_message = 'Uncommitted changes'
						return string.format(' %s • %s', author, commit_message)
					end
					local max_commit_message_length = 255
					if #commit_message > max_commit_message_length then
						commit_message = commit_message:sub(1, max_commit_message_length) .. '...'
					end
					return string.format(
						' %s, %s • %s',
						author,
						string.format(
							'%s %s ago',
							time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5),
							time_postfix
						),
						commit_message
					)
				end,
			},
			live_gutter = {
				enabled = true,
				edge_navigation = true, -- This allows users to navigate within a hunk
			},
			authorship_code_lens = {
				enabled = true,
			},
			scene = {
				diff_preference = 'unified',
			},
			diff_preview = {
				keymaps = {
					buffer_stage = 'S',
					buffer_unstage = 'U',
					buffer_hunk_stage = 's',
					buffer_hunk_unstage = 'u',
					toggle_view = 't',
				},
			},
			project_diff_preview = {
				keymaps = {
					buffer_stage = 's',
					buffer_unstage = 'u',
					buffer_hunk_stage = 'gs',
					buffer_hunk_unstage = 'gu',
					buffer_reset = 'r',
					stage_all = 'S',
					unstage_all = 'U',
					reset_all = 'R',
				},
			},
			symbols = {
				void = '⣿',
			},
		}
	})
end

return M
