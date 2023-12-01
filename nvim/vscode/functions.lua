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
