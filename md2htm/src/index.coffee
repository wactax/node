#!/usr/bin/env coffee

> cmark-gfm:cmark

< (md)=>
  # md = htm.replace(
  #   /\[([^\]]+)\]\(([^)]+)\)/g
  #   (_,text,link)=>
  #     """<a href="#{encode link}">#{text}</a>"""
  # )
  cmark.renderHtml(
    md
    {
      hardbreaks:true
      liberalHtmltag: true
      unsafe: true
      extensions:
        strikethrough: true
    }
  )
