isSame = (code, guess)->
  if code.length is guess.length
    return (code is guess)
toHash = (num)->
  arr = []
  arr = num
    .toString()
    .split ""
    .map (i)-> i = i-0
  arr
getQuestion = (answer,length)->
  throw new Error if (typeof arguments[0]) is "string"
  length = 4 if !length
  q = {}
  q.answer = answer
  q.getHint = (guess)->
    return true if @answer is guess
    cArr = toHash @answer
    gArr = toHash guess
    throw new Error if cArr.length isnt gArr.length
    remain = []
    hint   = []
    for key, val of cArr
      if val is gArr[key]
        hint.push "+"
      else
        cIndex = remain.indexOf val
        gIndex = remain.indexOf gArr[key]
        if cIndex is -1
          remain.push val
        else
          remain.splice cIndex, 1
          hint.push "-"
        if gIndex is -1
          remain.push gArr[key]
        else
          remain.splice gIndex, 1
          hint.push "-"
    hint.sort "+","-"
    return hint
  q

module.exports = getQuestion