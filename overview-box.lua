-- Put the chapter overview in a box in the PDF as well as the HTML.
--
-- In HTML, `::: {.overview}` is styled by chapter-overview.scss and there is
-- nothing to do here. LaTeX has no equivalent: pandoc drops a div it does not
-- recognise, so the overview came out as a bare heading and two paragraphs,
-- indistinguishable from the chapter body around it.
--
-- So in LaTeX only, swap the div for the `rbpoverview` environment defined in
-- pdf-preamble.tex. The heading inside is lifted out and becomes the box title,
-- because a \section* set inside a tcolorbox looks wrong and lands in the
-- table of contents at the wrong level.

local function is_latex()
  return FORMAT:match("latex") ~= nil
end

-- pdf-preamble.tex defines `rbpoverview` as a tcolorbox, but it is only loaded
-- by the book's own PDF format. Rendering to any OTHER latex format reached
-- this filter with no definition and died with:
--
--   LaTeX Error: Environment rbpoverview undefined.
--
-- So ship a plain rules-above-and-below fallback with the filter. It is
-- deferred to \AtBeginDocument and guarded on the name, so pdf-preamble.tex's
-- nicer version always wins when it is present, and this only fires when
-- nothing else defined one.
--
-- `#1` stays single. On older LaTeX, \AtBeginDocument stored its argument with
-- \gdef and the hash had to be doubled; the current hook system does not, and
-- `##1` there fails with "Illegal parameter number in definition of
-- \reserved@b". Doubling it is the obvious-looking fix and it is wrong here.
local FALLBACK = [[
\makeatletter
\AtBeginDocument{%
  \@ifundefined{rbpoverview}{%
    \newenvironment{rbpoverview}[1]{%
      \par\medskip\noindent\hrule\smallskip
      \noindent\textbf{#1}\par\smallskip
    }{%
      \par\smallskip\noindent\hrule\medskip
    }%
  }{}%
}
\makeatother
]]

local injected = false

local function ensure_fallback()
  if injected then
    return
  end
  injected = true
  quarto.doc.include_text("in-header", FALLBACK)
end

function Div(el)
  if not el.classes:includes("overview") then
    return nil
  end

  if not is_latex() then
    return nil
  end

  ensure_fallback()

  -- Default title, in case a chapter's box has no heading in it.
  local title = "Overview"
  local body = pandoc.List({})

  for _, blk in ipairs(el.content) do
    if blk.t == "Header" then
      title = pandoc.utils.stringify(blk)
    else
      body:insert(blk)
    end
  end

  local out = pandoc.List({})
  out:insert(pandoc.RawBlock("latex", "\\begin{rbpoverview}{" .. title .. "}"))
  out:extend(body)
  out:insert(pandoc.RawBlock("latex", "\\end{rbpoverview}"))
  return out
end
