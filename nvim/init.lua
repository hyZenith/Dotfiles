vim.opt.number               = true
vim.opt.relativenumber       = true
vim.opt.tabstop              = 3
vim.opt.shiftwidth           = 3
vim.opt.expandtab            = false
vim.opt.smartindent          = true
vim.opt.mouse                = "a"
vim.opt.ignorecase           = false
vim.opt.smartcase            = true
vim.opt.hlsearch             = true
vim.opt.colorcolumn          = ""
vim.opt.syntax               = "enable"
vim.opt.termguicolors        = true
vim.opt.background           = "dark"
vim.opt.backup               = false
vim.opt.writebackup          = false
vim.opt.swapfile             = false
vim.opt.undofile             = true
vim.opt.timeout              = false
vim.g.mapleader              = " "
vim.g.targets_nl             = "nh"

Map = vim.keymap.set
Cmd = vim.cmd
VSCodeNotify = vim.fn.VSCodeNotify
VSCodeCall = vim.fn.VSCodeCall


-- require('options')
-- require('functions')

if vim.g.vscode then

---functions
function Center_screen() Cmd("call <SNR>3_reveal('center', 0)") end

function Top_screen() Cmd("call <SNR>3_reveal('top', 0)") end

function Bottom_screen() Cmd("call <SNR>3_reveal('bottom', 0)") end

function Move_to_top_screen()
	Cmd("call <SNR>3_moveCursor('top')")
end

function Move_to_bottom_screen()
	Cmd("call <SNR>3_moveCursor('bottom')")
end

function Toggle_fold() vim.fn.VSCodeNotify("editor.toggleFold") end

function Goto_parent_fold() vim.fn.VSCodeNotify("editor.gotoParentFold") end

function Next_folding_section() vim.fn.VSCodeNotify("editor.gotoNextFold") end

function Prev_folding_section() vim.fn.VSCodeNotify("editor.gotoPreviousFold") end


function Reveal_definition_aside() vim.fn.VSCodeNotify("editor.action.revealDefinitionAside") end

function Toggle_sticky_scroll() vim.fn.VSCodeNotify("editor.action.toggleStickyScroll") end

function Trim_trailing_whitespace() vim.fn.VSCodeNotify("editor.action.trimTrailingWhitespace") end

function Save() VSCodeCall("workbench.action.files.save") end

function Trim__save__no_highlight()
	Trim_trailing_whitespace()
	Save()
	Remove_highlighting()
end

function Open_link() vim.fn.VSCodeNotify("editor.action.openLink") end

function Outdent()
---@diagnostic disable-next-line: unused-local
    for i = 1, vim.v.count1 do
        vim.fn.VSCodeNotify("editor.action.outdentLines")
    end
end

function Indent()
---@diagnostic disable-next-line: unused-local
    for i = 1, vim.v.count1 do
        vim.fn.VSCodeNotify("editor.action.indentLines")
    end
end


function Split_editor() vim.fn.VSCodeNotify("workbench.action.splitEditor") end
function Focus_2ndeditor() vim.fn.VSCodeNotify("workbench.action.focusSecondEditorGroup") end
function Focus_1steditor() vim.fn.VSCodeNotify("workbench.action.focusFirstEditorGroup") end

function Comment() vim.fn.VSCodeNotify("editor.action.commentLine") end

function Reindent() vim.fn.VSCodeNotify("editor.action.reindentlines") end

function Convert_to_spaces() vim.fn.VSCodeNotify("editor.action.indentationToSpaces") end

function Convert_to_tabs() vim.fn.VSCodeNotify("editor.action.indentationToTabs") end

function Indent_with_spaces() vim.fn.VSCodeNotify("editor.action.indentUsingSpaces") end

function Indent_with_tabs() vim.fn.VSCodeNotify("editor.action.indentUsingTabs") end

function Rename_symbol() vim.fn.VSCodeNotify("editor.action.rename") end

function Format_document()
    vim.fn.VSCodeNotify("editor.action.formatDocument")
    Trim_trailing_whitespace()
end

-- git --

function Git_unstage_file() vim.fn.VSCodeNotify("git.unstage") end

function Git_stage_all() vim.fn.VSCodeNotify("git.stageAll") end

function Git_stage_file() vim.fn.VSCodeNotify("git.stage") end

function Git_commit() vim.fn.VSCodeNotify("git.commit") end

function Git_push() vim.fn.VSCodeNotify("git.push") end

function Git_revert_change() vim.fn.VSCodeNotify("git.revertSelectedRanges") end

function Git_stage_change() vim.fn.VSCodeNotify("git.stageSelectedRanges") end

function Git_unstage_change() vim.fn.VSCodeNotify("git.unstageSelectedRanges") end

function Git_open_changes() vim.fn.VSCodeNotify("git.openChange") end

function Git_commit_amend() vim.fn.VSCodeNotify("git.commitStagedAmend") end

function Git_push_force() vim.fn.VSCodeNotify("git.pushForce") end

-- visual
function Outdent_vis() vim.fn.VSCodeNotifyVisual("editor.action.outdentLines", false) end

function Indent_vis() vim.fn.VSCodeNotifyVisual("editor.action.indentLines", false) end

function Comment_vis() vim.fn.VSCodeNotifyVisual("editor.action.commentLine", false) end

function Reindent_vis() vim.fn.VSCodeNotifyVisual("editor.action.reindentselectedlines", true) end

--maps
Map("", "J", Move_to_bottom_screen)
Map("", "K", Move_to_top_screen)
Map("", "U", Trim__save__no_highlight)
--  Vscode: All remaps
--    Map("", "zy", Toggle_typewriter)
Map("", "zp", Goto_parent_fold)
Map("", "]f", Next_folding_section)
Map("", "[f", Prev_folding_section)

-- Vscode: Normal remaps
Map("n", "gD",        Reveal_definition_aside)
Map("n", "<leader>s", Toggle_sticky_scroll)
Map("n", "<leader>r", Rename_symbol)
Map("n", "==",        Trim_trailing_whitespace)
Map("n", "gl",        Open_link)
Map("n", "<<",        Outdent)
Map("n", ">>",        Indent)
Map("n", "gcc",       Comment)
Map("n", "=>",        Reindent)
Map("n", "=s",        Convert_to_spaces)
Map("n", "=t",        Convert_to_tabs)
Map("n", "za",        Toggle_fold)
Map("n", "=ie",       Format_document)

Map("n", "<leader>ga", Git_stage_file)
Map("n", "<leader>gA", Git_stage_all)
Map("n", "<leader>gu", Git_unstage_file)
Map("n", "<leader>gm", Git_commit)
Map("n", "<leader>gM", Git_commit_amend)
Map("n", "<leader>gp", Git_push)
Map("n", "<leader>gP", Git_push_force)
Map("n", "<leader>gr", Git_revert_change)
Map("n", "<leader>gt", Git_stage_change)
Map("n", "<leader>gT", Git_unstage_change)
Map("n", "<leader>gn", Git_open_changes)

 --- Vscode: Visual remaps
Map("v", "<",  Outdent_vis)
Map("v", "gc", Comment_vis)
Map("v", ">",  Indent_vis)

-- -split editor remaps
Map("n", "<leader>v", Split_editor)
Map("n", "<leader>l", Focus_2ndeditor)
Map("n", "<leader>h", Focus_1steditor)



else
	-- require('nvim')
end

-- require('remaps')
-- require('registers/registers')
-- require('registers/text-objects')
-- require('registers/brackets')
-- -- require('features')
-- require('big/functions')
-- require('big/mappings')
-- require('plugins/plugins')
-- require('plugins/configuration')
-- require('plugins/keymaps')





print("nvm laoded")