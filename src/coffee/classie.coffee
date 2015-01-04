#!
# * classie - class helper functions
# * from bonzo https://github.com/ded/bonzo
# * 
# * classie.has( elem, 'my-class' ) -> true/false
# * classie.add( elem, 'my-new-class' )
# * classie.remove( elem, 'my-unwanted-class' )
# * classie.toggle( elem, 'my-class' )
# 

#jshint browser: true, strict: true, undef: true 
"use strict"

  # class helper functions from bonzo https://github.com/ded/bonzo
classReg = (className) ->
  new RegExp("(^|\\s+)" + className + "(\\s+|$)")

# classList support for class management
# altho to be fair, the api sucks because it won't accept multiple classes at once
toggleClass = (elem, c) ->
  fn = (if hasClass(elem, c) then removeClass else addClass)
  fn elem, c
  return

hasClass = undefined
addClass = undefined
removeClass = undefined
if "classList" of document.documentElement
  hasClass = (elem, c) ->
    elem.classList.contains c

  addClass = (elem, c) ->
    elem.classList.add c
    return

  removeClass = (elem, c) ->
    elem.classList.remove c
    return
else
  hasClass = (elem, c) ->
    classReg(c).test elem.className

  addClass = (elem, c) ->
    elem.className = elem.className + " " + c  unless hasClass(elem, c)
    return

  removeClass = (elem, c) ->
    elem.className = elem.className.replace(classReg(c), " ")
    return
    
classie =
  # full names
  hasClass: hasClass
  addClass: addClass
  removeClass: removeClass
  toggleClass: toggleClass
  
  # short names
  has: hasClass
  add: addClass
  remove: removeClass
  toggle: toggleClass
