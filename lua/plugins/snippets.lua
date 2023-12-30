local snippets = {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    event = "InsertEnter",
}

local tex_template = [=[
\documentclass[a4paper,12pt]{article}

\def \nauthor{${1:Andri Limacher}}
% Title used in the header
\def \ntitlehead{${2:Title}}

\usepackage[a4paper, top=2.5cm, left=2.5cm, total={16cm,25.2cm}]{geometry}
\usepackage[german]{babel}
\input{~/latex_template/header.tex}

\title{${3:Title}}
\author{\nauthor}

 % main
\begin{document}
\thispagestyle{empty}
\maketitle

\pagenumbering{Roman}
\addtocounter{page}{-1}
\thispagestyle{empty}
{ \hypersetup{hidelinks} \tableofcontents }
\newpage

\pagenumbering{arabic}
\setcounter{page}{1}

$4

\end{document}
% vim:spelllang=de:spell
]=]

local epi_quote = [=[
\epigraph{\textit{$1}}{\textit{$2}}
]=]

function snippets.config(_, opts)
    require("omega.modules.snippets").config(_, opts)
    local ls = require("luasnip")
    local parse = require("luasnip.util.parser").parse_snippet
    ls.add_snippets("tex", {
        parse({ trig = "template" }, tex_template),
        parse({ trig = "epiquote" }, epi_quote),
    })
end

return snippets
