" Fix files with prettier
let b:ale_fixers = ['rubocop']

" Use bundle exec for ruby executables
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_sorbet_executable = 'bundle'
