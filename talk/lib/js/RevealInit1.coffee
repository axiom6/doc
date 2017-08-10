# Full list of configuration options available here:
# https://github.com/hakimel/reveal.js#configuration
$(document).ready ->
  initialize()
  pdfCSS()
  return

initialize = () ->
  bower = '../../lib/bower_components/'
  revdir = bower + 'reveal.js/'
  Reveal.initialize( {
    controls:true, progress:true, history:true, center:true, slideNumber:true, transition:'slide'
    math: { mathjax: bower + 'MathJax/MathJax.js', config: 'TeX-AMS_HTML-full' }
    dependencies: [
      { src: revdir + 'lib/js/classList.js',                        condition: () ->   !document.body.classList }
      { src: revdir + 'plugin/markdown/marked.js',                  condition: () -> ! !document.querySelector('[data-markdown]') }
      { src: revdir + 'plugin/markdown/markdown.js',                condition: () -> ! !document.querySelector('[data-markdown]') }
      { src: revdir + 'plugin/highlight/highlight.js',  async:true, condition: () -> ! !document.querySelector('pre code') callback: -> hljs.initHighlightingOnLoad() }
      { src: revdir + 'plugin/zoom-js/zoom.js',         async:true }
      { src: revdir + 'plugin/math/math.js',            async:true } ] } )
  return

# PDF and Paper printing
pdfCSS = () ->
  bower = '../../lib/bower_components/'
  revdir = bower + 'reveal.js/'
  link = document.createElement('link')
  link.rel = 'stylesheet'
  link.type = 'text/css'
  link.href = if window.location.search.match(/print-pdf/gi) then revdir + 'css/print/pdf.css' else revdir + 'css/print/paper.css'
  document.getElementsByTagName('head')[0].appendChild link
  return
