#!/usr/bin/env coffee

> turndown:Turndown

Turndown.prototype.escape = (txt)=>txt

turndown = new Turndown {
  headingStyle:"atx"
  hr: '---'
  codeBlockStyle: "fenced"
}

turndown.addRule 'br',
  filter:'br'
  replacement: (content, node, options) ->
    li = ['<br']
    for i from node.attributes
      li.push ' '+i.localName
    li.join('')+'>'

turndown.addRule 'listItem',
  filter: 'li'
  replacement: (content, node, options) ->
    content = content.replace(/^\n+/, '').replace(/\n+$/, '\n').replace(/\n/gm, '\n  ')
    # indent
    prefix = options.bulletListMarker + ' '
    parent = node.parentNode
    if parent.nodeName == 'OL'
      start = parent.getAttribute('start')
      index = Array::indexOf.call(parent.children, node)
      prefix = (if start then Number(start) + index else index + 1) + '. '
    prefix + content + (if node.nextSibling and !/\n$/.test(content) then '\n' else '')

export default htm2md = (htm)=>
  turndown.turndown htm
