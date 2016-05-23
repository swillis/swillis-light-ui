root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe 'swillis-light-ui.fontSize', (value) ->
      setFontSize(value)

    atom.config.observe 'swillis-light-ui.layoutMode', (value) ->
      setLayoutMode(value)

    atom.config.observe 'swillis-light-ui.tabSizing', (value) ->
      setTabSizing(value)

  deactivate: ->
    unsetFontSize()
    unsetLayoutMode()
    unsetTabSizing()

# Font Size -----------------------
setFontSize = (currentFontSize) ->
  if Number.isInteger(currentFontSize)
    root.style.fontSize = "#{currentFontSize}px"
  else if currentFontSize is 'Auto'
    unsetFontSize()

unsetFontSize = ->
  root.style.fontSize = ''

# Layout Mode -----------------------
setLayoutMode = (layoutMode) ->
  root.setAttribute('theme-swillis-light-ui-layoutmode', layoutMode.toLowerCase())

unsetLayoutMode = ->
  root.removeAttribute('theme-swillis-light-ui-layoutmode')

# Tab Sizing -----------------------
setTabSizing = (tabSizing) ->
  root.setAttribute('theme-swillis-light-ui-tabsizing', tabSizing.toLowerCase())

unsetTabSizing = ->
  root.removeAttribute('theme-swillis-light-ui-tabsizing')
