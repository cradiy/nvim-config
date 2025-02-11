local function make_position_params()
	if vim.fn.has("nvim-0.11") == 1 then
		return function(client)
			return vim.lsp.util.make_position_params(nil, client.offset_encoding)
		end
	else
		---@diagnostic disable-next-line: missing-parameter
		return vim.lsp.util.make_position_params()
	end
end

function Hover()
	local params = make_position_params()
	vim.lsp.buf_request(0, "textDocument/hover", params, require("noice.lsp.hover").on_hover)
end
