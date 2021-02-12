#### VIM SURROUND
New example

[ <-- space
] <-- no space
`ysiw[`
`this = thing` => `[ this ] = thing`
  ^
`ds[`
`[this] = thing` => `this = thing`
  ^
`yss)`
`[this] = thing` => `([this] = thing)` 
  ^
