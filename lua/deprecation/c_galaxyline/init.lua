-- require'nvim-web-devicons'.setup()
-- Line designed by ChristianChiarulli
-- changed colors to nord set by matthias.dold

local gl = require('galaxyline')
local gls = gl.section gl.short_line_list = {'LuaTree','vista','dbui'}

  -- some specific from myself
local colors = {
  bg = '#282c34',
  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#608B4E',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#d16d9e',
  grey = '#c0c0c0',
  blue = '#569CD6',
  red = '#D16969',
  nord_green = '#a3be8c',
  nord_dark_blue = '#5e81ac',
  nord_blue = '#81a1c1',
  nord_cyan = '#88c0d0',
  nord_cyan_bright = '#8fbcbb',
  nord_magenta = '#b48ead',
  nord_black = '#2e3440',
  nord_red = '#bf616a',
  nord_white = '#eceff4',
  nord_yellow = '#ebcb8b',
  nord_orange = '#d08770',
  nord_purple = '#5d4d7a',
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local function lsp_status(status)
    local shorter_stat = ''
    for match in string.gmatch(status, "[^%s]+")  do
        local err_warn = string.find(match, "^[WE]%d+", 0)
        if not err_warn then
            shorter_stat = shorter_stat .. ' ' .. match
        end
    end
    return shorter_stat
end

---a
---alocal function get_coc_lsp()
---a  local status = vim.fn['coc#status']()
---a  if not status or status == '' then
---a      return ''
---a  end
---a  return lsp_status(status)
---aend
---a
---afunction get_diagnostic_info()
---a  if vim.fn.exists('*coc#rpc#start_server') == 1 then
---a    return get_coc_lsp()
---a    end
---a  return ''
---aend

local function get_current_func()
  local has_func, func_name = pcall(vim.fn.nvim_buf_get_var,0,'coc_current_function')
  if not has_func then return end
      return func_name
  end

--function get_function_info()
--  if vim.fn.exists('*coc#rpc#start_server') == 1 then
--    return get_current_func()
--    end
--  return ''
--end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return ' '
    else
        return nil
    end
end

--CocStatus = get_diagnostic_info
--CocFunc = get_current_func
TrailingWhiteSpace = trailing_whitespace

function has_file_type()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.nord_dark_blue,
                          i = colors.nord_green,
                          v = colors.nord_cyan,
                          [''] = colors.nord_blue,
                          V = colors.nord_cyan,
                          c = colors.nord_purple,
                          no = colors.magenta,
                          s = colors.nord_orange,
                          S = colors.nord_orange,
                          [''] = colors.nord_orange,
                          ic = colors.nord_yellow,
                          R = colors.nord_red,
                          Rv = colors.nord_red,
                          cv = colors.nord_red,
                          ce=colors.nord_red,
                          r = colors.nord_cyan,
                          rm = colors.nord_cyan,
                          ['r?'] = colors.nord_cyan,
                          ['!']  = colors.nord_red,
                          t = colors.nord_red}

      vim.api.nvim_command('hi GalaxyViMode guifg='..colors.nord_black)
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
      return '  ' .. vim.fn.expand('%:t:r') .. '.' .. vim.fn.expand('%:e') .. '  '
  end,
    separator = ' ',
    separator_highlight = {colors.nord_yellow, function()
      if not buffer_not_empty() then
        return colors.bg
      end
      return colors.bg
    end},
    highlight = {colors.grey, colors.bg,'bold'},
  },
}

-- gls.left[3] ={
--   FileIcon = {
--     separator = ' ',
--     provider = 'FileIcon',
--     condition = buffer_not_empty,
--     highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
--   },
-- }
-- gls.left[4] = {
--   FileName = {
--     provider = {'FileSize'},
--     condition = buffer_not_empty,
--     separator = ' ',
--     separator_highlight = {colors.nord_magenta,colors.bg},
--     highlight = {colors.magenta,colors.bg}
--   }
-- }

gls.left[3] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = buffer_not_empty,
    highlight = {colors.nord_orange,colors.bg},
  }
}
gls.left[4] = {
  GitBranch = {
    provider = 'GitBranch',
    separator = ' ',
    separator_highlight = {colors.nord_magenta,colors.bg},
    condition = buffer_not_empty,
    highlight = {colors.grey,colors.bg},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    -- separator = ' ',
    -- separator_highlight = {colors.nord_magenta,colors.bg},
    icon = '  ',
    highlight = {colors.nord_green,colors.bg},
  }
}
gls.left[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    -- separator = ' ',
    -- separator_highlight = {colors.nord_magenta,colors.bg},
    icon = '  ',
    highlight = {colors.nord_blue,colors.bg},
  }
}
gls.left[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    -- separator = ' ',
    -- separator_highlight = {colors.nord_magenta,colors.bg},
    icon = '  ',
    highlight = {colors.nord_red,colors.bg},
  }
}
gls.left[8] = {
  LeftEnd = {
    provider = function() return ' ' end,
    separator = ' ',
    separator_highlight = {colors.nord_magenta,colors.bg},
    highlight = {colors.nord_magenta,colors.bg}
  }
}
--gls.left[9] = {
--  DiagnosticError = {
--    provider = 'DiagnosticError',
--    icon = '  ',
--    highlight = {colors.nord_red,colors.bg}
--  }
--}
--gls.left[10] = {
--  Space = {
--    provider = function () return '' end
--  }
--}
--gls.left[11] = {
--  DiagnosticWarn = {
--    provider = 'DiagnosticWarn',
--    icon = '  ',
--    highlight = {colors.nord_yellow,colors.bg},
--  }
--}
--gls.left[12] = {
--  DiagnosticHint = {
--    provider = 'DiagnosticHint',
--    icon = '   ',
--    highlight = {colors.nord_blue,colors.bg},
--  }
--}
--gls.left[13] = {
--  DiagnosticInfo = {
--    provider = 'DiagnosticInfo',
--    icon = '   ',
--    highlight = {colors.nord_green, colors.bg},
--  }
--}

--[[
gls.right[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ':',
    highlight = {colors.nord_cyan,colors.bg,'bold'}
  }
}
]]

-- gls.right[1] = {
--     CocStatus = {
--      provider = CocStatus,
--      highlight = {colors.green,colors.bg},
--      icon = ':',
--     }
-- }
-- 
-- gls.left[2] = {
--   CocFunc = {
--     provider = CocFunc,
--     icon = '  λ ',
--     highlight = {colors.yellow,colors.bg},
--   }
-- }

gls.right[3]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = {colors.bg,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
}
gls.right[4] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
  },
}
gls.right[5] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' |',
    separator_highlight = {colors.darkblue,colors.bg},
    highlight = {colors.grey,colors.bg},
  }
}
gls.right[6] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.nord_green,colors.nord_black},
  }
}

-- gls.short_line_left[1] = {
--   BufferType = {
--     provider = 'FileTypeName',
--     separator = ' ',
--     separator_highlight = {colors.nord_magenta,colors.bg},
--     highlight = {colors.grey,colors.nord_magenta}
--   }
-- }

gls.short_line_left[1] = {
  LeftEnd = {
    provider = function() return ' > ' end,
    separator = ' ',
    separator_highlight = {colors.nord_blue,colors.bg},
    highlight = {colors.nord_blue,colors.bg}
  }
}
