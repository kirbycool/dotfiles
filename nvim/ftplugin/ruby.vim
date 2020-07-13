" Fix files with prettier
let b:ale_fixers = ['rubocop']
" Use bundler rubocop (hack around bunlder ale bug)
let g:ale_ruby_rubocop_executable = 'bundle'
