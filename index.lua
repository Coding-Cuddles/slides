-- Renders the index page from README.md: keeps the Curriculum section, points
-- deck links at the rendered PDFs, and restores the Bootstrap table classes.

function Link(link)
  if link.target:match("^%a[%w+.-]*:") then
    return link
  end

  local path = link.target:match("^([^#]+)")
  if path and path:match("%.md$") then
    link.target = path:gsub("%.md$", ".pdf")
  end

  return link
end

function Table(tbl)
  tbl.attr.classes = { "table", "table-striped" }

  -- Pipe tables carry column widths derived from the source layout, which
  -- Bootstrap should decide instead.
  for i in ipairs(tbl.colspecs) do
    tbl.colspecs[i] = { pandoc.AlignDefault, nil }
  end

  return tbl
end

function Pandoc(doc)
  local blocks = {}
  local keeping = false

  for _, block in ipairs(doc.blocks) do
    if block.t == "Header" and block.level <= 2 then
      keeping = pandoc.utils.stringify(block.content) == "Curriculum"
    end

    if keeping then
      table.insert(blocks, block)
    end
  end

  if #blocks == 0 then
    error("README.md has no Curriculum section")
  end

  return pandoc.Pandoc(blocks, doc.meta)
end
